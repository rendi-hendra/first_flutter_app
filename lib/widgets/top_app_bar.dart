import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    required this.title,
    this.style,
    this.firstIcon,
    this.secondIcon,
    this.onFirstPressed,
    this.onSecondPressed,
  });
  final String title;
  final TextStyle? style;
  final IconData? firstIcon;
  final IconData? secondIcon;
  final VoidCallback? onFirstPressed;
  final VoidCallback? onSecondPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style:
                style ?? TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          Spacer(),

          if (firstIcon != null)
            IconButton(icon: Icon(firstIcon), onPressed: onFirstPressed),

          if (firstIcon != null && secondIcon != null) const SizedBox(width: 1),

          if (secondIcon != null)
            IconButton(icon: Icon(secondIcon), onPressed: onSecondPressed),
        ],
      ),
      backgroundColor: theme.colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
