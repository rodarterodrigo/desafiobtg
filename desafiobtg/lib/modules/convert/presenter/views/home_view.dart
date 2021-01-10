import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/routes/app_routes.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/enums/buttom_style.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_textfield.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            title: Text("Currency Convert"),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(convertCurrencyController.convertValue.toString(), style: TextStyle(fontSize: 24),),
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
                            labelText: "Digite o valor",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.teal[100],
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Row(
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
        ),
    );
  }
}