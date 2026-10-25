import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoinTileSkeleton extends StatelessWidget {
  const CoinTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            minTileHeight: 72,
            contentPadding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 8,
            ),
            leading: const Bone.circle(size: 44),
            title: const Bone.text(words: 2),
            subtitle: const Bone.text(words: 1),
            trailing: const Bone(
              width: 68,
              height: 30,
              borderRadius: BorderRadius.all(Radius.circular(999)),
            ),
          );
        },
      ),
    );
  }
}
