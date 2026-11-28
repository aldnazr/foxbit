import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:foxbit/app/design/app_design.dart';
import 'package:foxbit/core/utils/util.dart';
import 'package:foxbit/features/search/application/crypto_search_controller.dart';
import 'package:foxbit/shared/models/coin_detail_args.dart';
import 'package:foxbit/shared/models/search_coin_model.dart';
import 'package:foxbit/shared/widgets/default_appbar.dart';
import 'package:foxbit/shared/widgets/error_handler.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  Timer? _debounce;
  String _rawQuery = '';
  String _query = '';

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    setState(() => _rawQuery = value);

    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      setState(() => _query = '');
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() => _query = trimmed);
    });
  }

  void _onSubmitted(String value) {
    _debounce?.cancel();
    FocusScope.of(context).unfocus();
    setState(() {
      _rawQuery = value;
      _query = value.trim();
    });
  }

  void _clear() {
    _debounce?.cancel();
    _controller.clear();
    _focusNode.requestFocus();
    setState(() {
      _rawQuery = '';
      _query = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: 'Pencarian'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              textInputAction: TextInputAction.search,
              autocorrect: false,
              enableSuggestions: false,
              onChanged: _onChanged,
              onSubmitted: _onSubmitted,
              decoration: InputDecoration(
                labelText: 'Cari kripto',
                hintText: 'Nama atau simbol, misalnya Bitcoin',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _rawQuery.isNotEmpty
                    ? IconButton(
                        tooltip: 'Hapus pencarian',
                        onPressed: _clear,
                        icon: const Icon(Icons.close_rounded),
                      )
                    : null,
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (_query.isEmpty) {
      return const _SearchMessage(
        icon: Icons.search_rounded,
        title: 'Cari koin',
        body:
            'Ketik nama atau simbol koin, lalu pilih hasil untuk membuka '
            'halaman detailnya. Contoh: Bitcoin atau BTC.',
      );
    }

    return ref
        .watch(cryptoSearchProvider(_query))
        .when(
          loading: () => const _SearchSkeleton(),
          error: (_, _) => ErrorHandler(
            errorText: 'Pencarian gagal. Periksa koneksi lalu coba lagi.',
            onPressed: () => ref.invalidate(cryptoSearchProvider(_query)),
          ),
          data: (coins) {
            if (coins.isEmpty) {
              return _SearchMessage(
                icon: Icons.search_off,
                title: 'Tidak ada hasil untuk "$_query"',
                body: 'Periksa ejaan atau coba nama atau simbol lain.',
              );
            }
            return _SearchResults(coins: coins);
          },
        );
  }
}

class _SearchResults extends StatelessWidget {
  final List<SearchCoin> coins;

  const _SearchResults({required this.coins});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewPaddingOf(context).bottom + 88,
      ),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        final image = coin.large ?? coin.thumb;
        final hasImage = image != null && image.isNotEmpty;
        final symbol = coin.symbol.trim();
        final initial = symbol.isEmpty
            ? '?'
            : symbol.substring(0, 1).toUpperCase();

        return ListTile(
          key: ValueKey(coin.id),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          onTap: () {
            context.push(
              '/coin/${coin.id}',
              extra: CoinDetailArgs(
                id: coin.id,
                name: coin.name,
                symbol: coin.symbol,
                image: image,
                marketCapRank: coin.marketCapRank,
              ),
            );
          },
          leading: CircleAvatar(
            radius: 20,
            foregroundImage: hasImage ? NetworkImage(image) : null,
            backgroundColor: hasImage
                ? Colors.transparent
                : defaultContainer(context),
            child: hasImage
                ? null
                : Text(
                    initial,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
          title: Text(
            coin.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            coin.symbol.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall
                ?.copyWith(fontSize: 12, letterSpacing: 0.5),
          ),
          trailing: coin.marketCapRank == null
              ? null
              : Text(
                  '#${coin.marketCapRank}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: defaultSecondaryColor(context),
                  ),
                ),
        );
      },
    );
  }
}

class _SearchSkeleton extends StatelessWidget {
  const _SearchSkeleton();

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      container: true,
      label: 'Mencari koin',
      child: Skeletonizer.zone(
        effect: reduceMotion
            ? SolidColorEffect(
                color: AppDesign.surfaceAlt(Theme.of(context).brightness),
              )
            : null,
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 16),
          itemCount: 9,
          itemBuilder: (context, index) {
            if (index == 8) {
              return SizedBox(
                height: MediaQuery.viewPaddingOf(context).bottom + 88,
              );
            }
            return const ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: Bone.circle(size: 40),
              title: Bone.text(words: 2),
              subtitle: Bone.text(words: 1),
              trailing: Bone(width: 32, height: 14, uniRadius: 4),
            );
          },
        ),
      ),
    );
  }
}

class _SearchMessage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _SearchMessage({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: AppEntry(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: defaultContainer(context),
            borderRadius: BorderRadius.circular(AppDesign.r24),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Icon(icon, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                body,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
