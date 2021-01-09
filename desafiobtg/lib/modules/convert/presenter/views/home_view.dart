import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final Currency from;
  final Currency to;

  Home({this.from, this.to});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    ListCurrencyController listCurrencyController = Provider.of<ListCurrencyController>(context);
    listCurrencyController.getListCurrency();
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Currency List"),
            centerTitle: true,
          ),
          body: Consumer<ListCurrencyController>(
            builder: (context, listCurrencyController, widget) {
              return listCurrencyController.currencyList.length < 1?
              Center(child: CircularProgressIndicator()):
              ListView.separated(
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CurrencyCard(
                        isTaped: listCurrencyController.isTaped,
                        onTap: () => listCurrencyController.setCardTaped(index),
                        currency: listCurrencyController.currencyList[index],
                      ),
                    )
                  );
                },
                separatorBuilder: (context, index) => Divider( height: 1, color: Colors.transparent,),
                itemCount: listCurrencyController.currencyList.length
              );
            },
          ),
        ),
    );
  }
}
