import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vault_chain/shared/models/portofolio_model.dart';

part 'portofolio_controller.g.dart';

@Riverpod(keepAlive: true)
class PortofolioController extends _$PortofolioController {
  static const String portofolioBox = "portofolioBox";
  static const String boxKey = "portofolioData";

  @override
  Future<List<PortofolioModel>> build() async {
    final box = await Hive.openBox(portofolioBox);
    final stored = box.get(boxKey, defaultValue: []);
    if (stored is List) {
      return stored
          .map((e) => PortofolioModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }

  Future<void> toggleFavorite(PortofolioModel portofolio) async {
    final box = Hive.box(portofolioBox);
    final currentList = state.value ?? [];
    final exists = currentList.any((e) => e.id == portofolio.id);

    final stored = (box.get(boxKey, defaultValue: []) as List).toList();

    if (exists) {
      stored.removeWhere((e) => e["id"] == portofolio.id);
    } else {
      stored.add(portofolio.toJson());
    }

    await box.put(boxKey, stored);

    final updated = stored
        .map((e) => PortofolioModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    state = AsyncData(updated);
  }
}

@riverpod
bool isFavorite(Ref ref, String id) {
  final portofolioList = ref.watch(
    portofolioControllerProvider.select((async) => async.value ?? []),
  );
  return portofolioList.any((e) => e.id == id);
}
