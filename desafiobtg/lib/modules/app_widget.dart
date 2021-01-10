import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<ListCurrencyController>.value(value: ListCurrencyController()),
        ChangeNotifierProvider<ConvertCurrencyController>.value(value: ConvertCurrencyController()),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: "Desafio BTG",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          accentColor: Colors.teal[200],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          errorColor: Color.fromRGBO(255, 77, 106, 1),
        ),
        themeMode: ThemeMode.light,
        initialRoute: Modular.initialRoute,
        onGenerateRoute: Modular.generateRoute,
      )
    );
  }
}