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
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Modular.navigatorKey,
        title: "Desafio BTG",
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // cardColor: Colors.teal,
          accentColor: Color.fromRGBO(255, 173, 1, 1),
          errorColor: Color.fromRGBO(255, 77, 106, 1),
        ),
        darkTheme:  ThemeData(
          primaryColor: Color.fromRGBO(29, 29, 36, 1),
          accentColor: Color.fromRGBO(255, 173, 1, 1),
          scaffoldBackgroundColor: Colors.teal,
          cardColor: Color.fromRGBO(45, 45, 55, 1),
          errorColor: Color.fromRGBO(255, 77, 106, 1),
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        themeMode: ThemeMode.light,
        initialRoute: Modular.initialRoute,
        onGenerateRoute: Modular.generateRoute,
      )
    );
  }
}