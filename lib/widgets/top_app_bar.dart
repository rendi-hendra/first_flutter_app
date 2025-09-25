import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          Spacer(),
          Icon(Icons.camera_alt_outlined),
          SizedBox(width: 20),
          Icon(Icons.more_vert),
        ],
      ),
      backgroundColor: theme.colorScheme.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
