import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:foxbit/core/utils/util.dart';

class const DefaultAppbar({
  super.key,
  required final String title,
  final List<Widget>? actions,
}) extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();

    return AppBar(
      title: Text(title),
      titleTextStyle: .new(fontSize: 20, fontWeight: .bold),
      titleSpacing: 22,
      actions: actions,
      automaticallyImplyLeading: false,
      leadingWidth: canPop ? 60 : null,
      leading: canPop ? const _AppbarBackButton() : null,
    );
  }
}

class _AppbarBackButton extends StatelessWidget {
  const _AppbarBackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Material(
          color: defaultContainer(context),
          shape: CircleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => context.pop(),
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            ),
          ),
        ),
      ),
    );
  }
}
