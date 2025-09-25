import 'package:flutter/material.dart';
import 'package:flutter_application_1/state/my_app_state.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  final PageController pageController;
  const BottomBar({super.key, required this.pageController});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    _currentIndex = appState.pageCount;

    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        appState.setPageCount(i);
        widget.pageController.jumpToPage(i);
      },
      items: [
        /// ===== Chats (dengan badge) =====
        SalomonBottomBarItem(
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -10),
            badgeContent: const Text(
              '20',
              style: TextStyle(color: Colors.black, fontSize: 10),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.green,
              padding: EdgeInsets.all(4),
            ),
            child: const Icon(Icons.chat, color: Colors.white),
          ),
          title: Text("Chats"),
          selectedColor: Colors.green,
        ),

        /// ===== Updates =====
        SalomonBottomBarItem(
          icon: const Icon(Icons.circle_outlined, color: Colors.white),
          title: Text("Updates"),
          selectedColor: Colors.green,
        ),

        /// ===== Communities =====
        SalomonBottomBarItem(
          icon: const Icon(Icons.group_outlined, color: Colors.white),
          title: const Text("Communities"),
          selectedColor: Colors.green,
        ),

        /// ===== Calls =====
        SalomonBottomBarItem(
          icon: const Icon(Icons.call_outlined, color: Colors.white),
          title: const Text("Calls"),
          selectedColor: Colors.green,
        ),
      ],
    );
  }
}
