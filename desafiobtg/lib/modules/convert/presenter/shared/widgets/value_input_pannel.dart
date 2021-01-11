import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:flutter/material.dart';

import 'custom_textfield.dart';
class ValueInputPannel extends StatefulWidget {
  final TextEditingController valueController;
  final ConvertCurrencyController convertCurrencyController;
  final ListCurrencyController listCurrencyController;

  ValueInputPannel({@required this.convertCurrencyController, @required this.valueController, @required this.listCurrencyController});
  @override
  _ValueInputPannelState createState() => _ValueInputPannelState();
}

class _ValueInputPannelState extends State<ValueInputPannel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.teal[100],
        elevation: 10,
        child: Container(
          child: CustomTextField(
            clearTap: () => widget.convertCurrencyController.clear(widget.valueController),
            controller: widget.valueController,
            onChanged: (search) => widget.listCurrencyController.searchCurrency(search),
            borderColor: Colors.teal,
            keyboardType: TextInputType.number,
            labelText: "Digite o valor",
          ),
        ),
      ),
    );
  }
}
