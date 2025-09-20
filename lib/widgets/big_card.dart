import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.text, this.semanticsLabel});

  final String text;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.onPrimaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(text, style: style, semanticsLabel: semanticsLabel ?? text),
      ),
    );
  }
}
