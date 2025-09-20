import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          ColorScheme lightScheme =
              lightDynamic ??
              ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent);
          ColorScheme darkScheme =
              darkDynamic ??
              ColorScheme.fromSeed(
                seedColor: Colors.lightBlue,
                brightness: Brightness.dark,
              );

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Namer App',
            theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
            darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ← 1
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var pairFavorite = appState.favorites;
    var count = appState.count;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConnectivityExample(),
            SizedBox(height: 20),
            Text('Favorites: ${pairFavorite.length}'),
            for (var myPair in pairFavorite) Text('.${myPair.asPascalCase}'),
            SizedBox(height: 20),
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.increment();
                    appState.getNext();
                  },
                  child: Text('Next $count'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Counter(),
          ],
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var count = 0;

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void increment() {
    count++;
    notifyListeners();
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asPascalCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  final style = const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('StatefulWidget'),
        Text('Nilai: $count', style: style),
        ElevatedButton(onPressed: increment, child: const Text('Tambah')),
      ],
    );
  }
}

class ConnectivityExample extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ConnectivityExampleState createState() => _ConnectivityExampleState();
}

class _ConnectivityExampleState extends State<ConnectivityExample> {
  late final Stream<List<ConnectivityResult>> _connectivityStream;
  String connectionStatus = 'Memeriksa koneksi...';

  @override
  void initState() {
    super.initState();

    // 1. Cek status awal
    Connectivity().checkConnectivity().then((List<ConnectivityResult> results) {
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      _updateStatus(result);
    });

    // 2. Dengarkan perubahan
    _connectivityStream = Connectivity().onConnectivityChanged;
    _connectivityStream.listen((List<ConnectivityResult> results) {
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      _updateStatus(result);
    });
  }

  void _updateStatus(ConnectivityResult result) {
    setState(() {
      if (result == ConnectivityResult.mobile) {
        connectionStatus = 'Mobile Data';
      } else if (result == ConnectivityResult.wifi) {
        connectionStatus = 'Wi-Fi';
      } else {
        connectionStatus = 'Tidak ada koneksi';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Status koneksi: $connectionStatus',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
