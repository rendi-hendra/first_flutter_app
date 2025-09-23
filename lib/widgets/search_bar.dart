import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: theme.colorScheme.secondaryFixed,
          cursorHeight: 20,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsetsGeometry.directional(start: 20, end: 5),
              child: Icon(Icons.search),
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: theme.colorScheme.secondaryFixed.withValues(alpha: 0.5),
            ),
            filled: true,
            fillColor: theme.colorScheme.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
