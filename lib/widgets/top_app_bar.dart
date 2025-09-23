import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(
            'WhatsApp',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          Spacer(),
          Icon(Icons.search),
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
