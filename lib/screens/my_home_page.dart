import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/my_app_state.dart';
import '../widgets/big_card.dart';
import 'bottom_bar.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var pairFavorite = appState.favorites;
    var count = appState.count;

    final theme = Theme.of(context);
    final style = ElevatedButton.styleFrom(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      foregroundColor: theme.colorScheme.onPrimary,
    );

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.search, color: theme.colorScheme.onPrimary),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: theme.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.5,
                      ),
                    ),
                    filled: true,
                    fillColor: theme.colorScheme.primaryContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                  ),
                  style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Text('Favorites: ${pairFavorite.length}'),
                for (var myPair in pairFavorite)
                  Text('.${myPair.asPascalCase}'),
                SizedBox(height: 20),
                BigCard(text: pair.asPascalCase),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      style: style,
                      onPressed: () {
                        appState.toggleFavorite();
                      },
                      icon: Icon(icon, color: Colors.red),
                      label: Text('Like'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: style,
                      onPressed: () {
                        appState.increment();
                        appState.getNext();
                      },
                      child: Text('Next $count'),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Counter(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: const Text('AlertDialog description'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.onPrimaryContainer,
        tooltip: 'Alert Dialog',
        child: Icon(Icons.add, color: theme.colorScheme.onPrimary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
