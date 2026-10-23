import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vault_chain/features/portofolio/application/portofolio_controller.dart';
import 'package:vault_chain/features/portofolio/widgets/empty_portofolio.dart';
import 'package:vault_chain/shared/models/coin_detail_args.dart';

class PortofolioTab extends ConsumerWidget {
  const PortofolioTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portoAsync = ref.watch(portofolioControllerProvider);

    return portoAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, st) => Center(child: Text("Error: $err")),
      data: (portofolioList) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(portofolioControllerProvider);
          },
          child: portofolioList.isEmpty
              ? SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: EmptyPortofolio(onAddTap: () => context.go('/market')),
                )
              : ListView.builder(
                  itemCount: portofolioList.length,
                  itemBuilder: (context, index) {
                    final data = portofolioList[index];
                    final isFav = ref.watch(isFavoriteProvider(data.id));

                    return Column(
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            top: 0,
                            bottom: 0,
                            left: 20.0,
                            right: 14.0,
                          ),
                          onTap: () {
                            context.push(
                              '/coin/${data.id}',
                              extra: CoinDetailArgs(
                                id: data.id,
                                name: data.name,
                                symbol: data.symbol,
                                image: data.image,
                                marketCapRank: data.marketCapRank,
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            foregroundImage: NetworkImage(
                              data.image.replaceAll('/small_2x', 'small'),
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          title: Text(data.name),
                          subtitle: Text(data.symbol.toUpperCase()),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(portofolioControllerProvider.notifier)
                                  .toggleFavorite(data);
                            },
                            isSelected: isFav,
                            icon: const Icon(Icons.star_border_outlined),
                            selectedIcon: const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        if (index < portofolioList.length - 1)
                          const Divider(height: 0, thickness: 1),
                      ],
                    );
                  },
                ),
        );
      },
    );
  }
}
