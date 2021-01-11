import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:flutter/material.dart';

class ResultPannel extends StatefulWidget {
  final ConvertCurrencyController convertCurrencyController;

  ResultPannel({@required this.convertCurrencyController});
  @override
  _ResultPannelState createState() => _ResultPannelState();
}

class _ResultPannelState extends State<ResultPannel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        color: Colors.teal[100],
        child: Container(
          height: MediaQuery.of(context).size.width /3,
          width: MediaQuery.of(context).size.height /1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.convertCurrencyController.isLoading? CircularProgressIndicator():
              widget.convertCurrencyController.convert.from == null || widget.convertCurrencyController.convert.to == null?
              Padding(
                padding: EdgeInsets.all(8),
                child: Text("Resultado", style: TextStyle(fontSize: 20),),
              ):
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("De", style: TextStyle(fontSize: 20),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(widget.convertCurrencyController.from.currency.toString() == "null"? "":
                        widget.convertCurrencyController.from.currency.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Para", style: TextStyle(fontSize: 20),),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(widget.convertCurrencyController.to.currency.toString() == "null"? "":
                        widget.convertCurrencyController.to.currency.toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Text(widget.convertCurrencyController.to.currency.toString() + " " + widget.convertCurrencyController.convertValue.toString(),
                    style: TextStyle(fontSize: 20),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
