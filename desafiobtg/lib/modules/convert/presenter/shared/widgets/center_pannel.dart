import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:flutter/material.dart';
class CenterPannel extends StatefulWidget {
  final ConvertCurrencyController convertCurrencyController;

  CenterPannel({@required this.convertCurrencyController});

  @override
  _CenterPannelState createState() => _CenterPannelState();
}

class _CenterPannelState extends State<CenterPannel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width/1.07,
            child: Column(
              children: [
                AnimatedOpacity(
                  opacity: widget.convertCurrencyController.from.currency.toString() == "null"? 0: 1,
                  duration: Duration(milliseconds: 400),
                  child: Center(
                    child: Text(
                      widget.convertCurrencyController.from.currency.toString() == "null"? "":
                      widget.convertCurrencyController.from.currency.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
                if(widget.convertCurrencyController.from.currency.toString() != "null")Icon(Icons.arrow_downward, size: MediaQuery.of(context).size.height/10,),
                AnimatedOpacity(
                  opacity: widget.convertCurrencyController.to.currency.toString() == "null"? 0: 1,
                  duration: Duration(milliseconds: 400),
                  child: Center(
                    child: Text(
                      widget.convertCurrencyController.to.currency.toString() == "null"? "":
                      widget.convertCurrencyController.to.currency.toString(),
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
