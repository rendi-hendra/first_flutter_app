import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ConnectivityExampleState createState() => _ConnectivityExampleState();
}

class _ConnectivityExampleState extends State<ConnectivityApp> {
  late final Stream<List<ConnectivityResult>> _connectivityStream;
  IconData connectionStatus = Icons.search;

  @override
  void initState() {
    super.initState();

    Connectivity().checkConnectivity().then((List<ConnectivityResult> results) {
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      _updateStatus(result);
    });

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
        connectionStatus = Icons.signal_cellular_4_bar;
      } else if (result == ConnectivityResult.wifi) {
        connectionStatus = Icons.wifi;
      } else {
        connectionStatus = Icons.signal_cellular_off;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Icon(connectionStatus, size: 30, color: theme.colorScheme.onPrimary);
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: theme.colorScheme.onPrimaryContainer,
      child: IconTheme(
        data: IconThemeData(color: theme.colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            const Spacer(),
            ConnectivityApp(),
          ],
        ),
      ),
    );
  }
}
