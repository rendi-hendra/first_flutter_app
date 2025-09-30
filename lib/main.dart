import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/chat_model.dart';
import 'package:flutter_application_1/screens/status_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'state/my_app_state.dart';
import 'screens/my_home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  // init dulu
  await Hive.initFlutter();

  // buka box dulu sebelum dipakai
  await Hive.openBox('chat');
  runApp(const MainApp());
}

extension on HiveInterface {
  set defaultDirectory(String defaultDirectory) {}
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: ColorScheme.light(primary: Colors.white),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: const Color.fromARGB(255, 16, 16, 16),
            secondary: const Color.fromARGB(255, 46, 46, 46),
            secondaryFixed: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(
                color: const Color.fromARGB(255, 107, 107, 107),
                width: 1.5,
              ),
            ),
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => MyHomePage(),
          '/status': (BuildContext context) => StatusPage(),
        },
      ),
    );
  }
}
