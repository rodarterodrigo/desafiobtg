import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/bottom_pannel.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/center_pannel.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/result_pannel.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/value_input_pannel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final Currency from;
  final Currency to;
  final String target;

  Home({this.from, this.to, this.target});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController valueController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListCurrencyController listCurrencyController = Provider.of<ListCurrencyController>(context);
    ConvertCurrencyController convertCurrencyController = Provider.of<ConvertCurrencyController>(context);
    listCurrencyController.getListCurrency();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Conversor de moedas"),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ResultPannel(convertCurrencyController: convertCurrencyController),
                  ValueInputPannel(convertCurrencyController: convertCurrencyController, valueController: valueController, listCurrencyController: listCurrencyController),
                  CenterPannel(convertCurrencyController: convertCurrencyController),
                  BottomPannel(valueController: valueController, convertCurrencyController: convertCurrencyController, listCurrencyController: listCurrencyController)
                ],
              ),
            ),
          ),
        ),
    );
  }
}