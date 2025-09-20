import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'state/my_app_state.dart';
import 'screens/my_home_page.dart';

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
            title: 'Flutter App',
            theme: ThemeData(colorScheme: lightScheme, useMaterial3: true),
            darkTheme: ThemeData(colorScheme: darkScheme, useMaterial3: true),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
