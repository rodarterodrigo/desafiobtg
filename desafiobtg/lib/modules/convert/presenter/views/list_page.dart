import 'package:desafiobtg/modules/convert/presenter/controllers/convert_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/controllers/list_currency_controller.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/enums/buttom_style.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_card.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_textfield.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ListPage extends StatefulWidget {
  final String target;

  ListPage({this.target});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListCurrencyController listCurrencyController = Provider.of<ListCurrencyController>(context);
    ConvertCurrencyController convertCurrencyController = Provider.of<ConvertCurrencyController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Currency List"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      elevation: 10,
                      color: Colors.teal[100],
                      child: Container(
                        child: CustomTextField(
                          clearTap: () => listCurrencyController.clear(searchController),
                          controller: searchController,
                          onChanged: (search) => listCurrencyController.searchCurrency(search),
                          borderColor: Colors.teal,
                          labelText: "Buscar por sigla",
                        ),
                      ),
                    ),
                  ),
                   Consumer<ListCurrencyController>(
                      builder: (context, listCurrencyController, widget) {
                          if(listCurrencyController.failureCurrency != '') {
                            CustomFlutterToast.alert(listCurrencyController.failureCurrency);
                            listCurrencyController.failureCurrency = '';
                          }
                            return listCurrencyController.currencyList.length < 1?
                            Container(
                                height: MediaQuery.of(context).size.height /1.7,
                                child: Center(child: CircularProgressIndicator())):
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    color: Colors.teal[100],
                                    elevation: 10,
                                    child: Column(
                                        children: [
                                    Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                    height: MediaQuery.of(context).size.height /1.7,
                                    child: ListView.separated(
                                        itemBuilder: (context, index) {
                                          return Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8),
                                                child: CurrencyCard(
                                                  onTap: () => listCurrencyController.setCardTaped(index),
                                                  currency: listCurrencyController.currencyList[index],
                                                ),
                                              )
                                          );
                                        },
                                        separatorBuilder: (context, index) => Divider( height: 1, color: Colors.transparent,),
                                        itemCount: listCurrencyController.currencyList.length
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                            );
                        },
                      ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      borderOnForeground: true,
                      color: Colors.teal[100],
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width /1.20,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomButton(
                                  onPressed: () => listCurrencyController.backToHome(),
                                  text: "Voltar", buttonStyle: CustomButtonStyle.Secondary,
                                ),
                                CustomButton(
                                  onPressed: () {
                                    if(widget.target == "from"){
                                      listCurrencyController.selectedCurrency == null?
                                      CustomFlutterToast.alert("Selecione a moeda de origem"): convertCurrencyController.from = listCurrencyController.selectedCurrency;
                                    }
                                    if(widget.target == "to"){
                                      listCurrencyController.selectedCurrency == null?
                                      CustomFlutterToast.alert("Selecione a moeda de destino"): convertCurrencyController.to = listCurrencyController.selectedCurrency;
                                    }
                                    if(listCurrencyController.selectedCurrency != null) listCurrencyController.backToHome();
                                  },
                                  text: "Confirmar", buttonStyle: CustomButtonStyle.Primary,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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