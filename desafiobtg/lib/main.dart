import 'package:desafiobtg/modules/convert/presenter/views/home_view.dart';
import 'package:desafiobtg/modules/convert/presenter/views/list_page.dart';
import 'package:flutter/material.dart';

import 'modules/shared/routes/app_routes.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      routes: {
        Routes.home: (context) => Home(),
        Routes.listCurrencies: (context) => ListPage(),
      },
      title: 'TCE Parceiros',
      initialRoute: Routes.home,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.teal,
        hintColor: Colors.teal[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //errorColor: Color.fromRGBO(255, 77, 106, 1),
      ),
      scrollBehavior: const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    ),
  );
}