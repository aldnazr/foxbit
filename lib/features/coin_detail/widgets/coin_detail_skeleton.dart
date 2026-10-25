import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vault_chain/app/design/app_design.dart';

class CoinDetailSkeleton extends StatelessWidget {
  const CoinDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer.zone(
      ignoreContainers: true,
      child: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Bone.text(words: 2, fontSize: 32.0),
              const SizedBox(height: 12),
              Bone.square(
                size: 280,
                borderRadius: BorderRadius.circular(AppDesign.r24),
              ),
              const SizedBox(height: 16),
              Bone.square(
                size: 90,
                borderRadius: BorderRadius.circular(AppDesign.r24),
              ),
              const SizedBox(height: 16),
              Bone.square(
                size: 56,
                borderRadius: BorderRadius.circular(AppDesign.r16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
