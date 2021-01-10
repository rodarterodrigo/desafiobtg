
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/routes/app_routes.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/enums/buttom_style.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_buttom.dart';
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
  TextEditingController searchController = new TextEditingController();
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
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            onPressed: () async { Modular.to.pushNamed(Routes.LISTCURRENCY, arguments: "from");
                            listCurrencyController.clearList(); listCurrencyController.getListCurrency(); },
                            text: convertCurrencyController.from.currency != null?
                                  convertCurrencyController.from.currency.toString():
                                  "Origem", buttonStyle: CustomButtonStyle.Primary,
                          ),
                          CustomButton(
                            onPressed: () async { Modular.to.pushNamed(Routes.LISTCURRENCY, arguments: "to");
                            listCurrencyController.clearList(); listCurrencyController.getListCurrency(); },
                            text: convertCurrencyController.to.currency != null?
                                  convertCurrencyController.to.currency.toString():
                                  "Destino", buttonStyle: CustomButtonStyle.Primary,
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
    );
  }
}
