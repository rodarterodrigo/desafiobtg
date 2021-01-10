import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/enums/buttom_style.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_textfield.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
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
                            convertCurrencyController.isLoading? CircularProgressIndicator():
                                convertCurrencyController.convert.from == null || convertCurrencyController.convert.to == null?
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
                                      child: Text(convertCurrencyController.from.currency.toString() == "null"? "":
                                                  convertCurrencyController.from.currency.toString(),
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
                                      child: Text(convertCurrencyController.to.currency.toString() == "null"? "":
                                                  convertCurrencyController.to.currency.toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(convertCurrencyController.to.currency.toString() + " " + convertCurrencyController.convertValue.toString(), style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.teal[100],
                      elevation: 10,
                      child: Container(
                        child: CustomTextField(
                          clearTap: () => convertCurrencyController.clear(valueController),
                          controller: valueController,
                          onChanged: (search) => listCurrencyController.searchCurrency(search),
                          borderColor: Colors.teal,
                          keyboardType: TextInputType.number,
                          labelText: "Digite o valor",
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      height: MediaQuery.of(context).size.height/3.3,
                      width: MediaQuery.of(context).size.width/1.07,
                      child: Column(
                        children: [
                          AnimatedOpacity(
                            opacity: convertCurrencyController.from.currency.toString() == "null"? 0: 1,
                            duration: Duration(milliseconds: 400),
                            child: Center(
                              child: Text(
                                convertCurrencyController.from.currency.toString() == "null"? "":
                                convertCurrencyController.from.currency.toString(),
                                style: TextStyle(
                                    fontSize: 50
                                ),
                              ),
                            ),
                          ),
                          if(convertCurrencyController.from.currency.toString() != "null")Icon(Icons.arrow_downward, size: MediaQuery.of(context).size.height/10,),
                          AnimatedOpacity(
                            opacity: convertCurrencyController.to.currency.toString() == "null"? 0: 1,
                            duration: Duration(milliseconds: 400),
                            child: Center(
                              child: Text(
                                convertCurrencyController.to.currency.toString() == "null"? "":
                                convertCurrencyController.to.currency.toString(),
                                style: TextStyle(
                                    fontSize: 50
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.teal[100],
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomButton(
                                        onPressed: () async => listCurrencyController.getOriginCurrency(),
                                        text: convertCurrencyController.from.currency != null?
                                              convertCurrencyController.from.currency.toString():
                                              "Origem", buttonStyle: CustomButtonStyle.Primary,
                                      ),
                                      CustomButton(
                                        onPressed: () async => listCurrencyController.getDestinyCurrency(),
                                        text: convertCurrencyController.to.currency != null?
                                              convertCurrencyController.to.currency.toString():
                                              "Destino", buttonStyle: CustomButtonStyle.Primary,
                                      ),
                                      CustomButton(
                                        onPressed: () async => convertCurrencyController.commitConvert(valueController),
                                        text: "Converter", buttonStyle: CustomButtonStyle.Secondary,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          child: CustomButton(
                                            onPressed: () async => convertCurrencyController.clearCurrencyConvertion(),
                                            text: "Reset", buttonStyle: CustomButtonStyle.Primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}