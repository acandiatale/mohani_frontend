import 'package:flutter/material.dart';
import 'package:mohani/screens/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0XFFE7626C),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
