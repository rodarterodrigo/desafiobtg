import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: "Desafio BTG",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      darkTheme:  ThemeData(
        primaryColor: Colors.blue,
        accentColor: Color.fromRGBO(255, 173, 1, 1),
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.blue,
        errorColor: Color.fromRGBO(255, 77, 106, 1),
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      themeMode: ThemeMode.light,
      initialRoute: Modular.initialRoute,
      home: null,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}