import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:foxbit/core/utils/util.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
  });

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();

    return AppBar(
      title: title != null ? Text(title!) : titleWidget,
      titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
