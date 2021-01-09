import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/list_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListCurrencyController extends ChangeNotifier{

  List<Currency> _currencyList= new List<Currency>();
  get currencyList => _currencyList;
  set currencyList(value) { _currencyList = value; notifyListeners(); }

  String _failureCurrency = "";
  get failureCurrency => _failureCurrency;
  set failureCurrency(value) { _failureCurrency = value; notifyListeners();}

  final ListCurrency usecase = Modular.get<ListCurrency>();

  Future getListCurrency() async { if(currencyList.length < 1) await usecase.listCurrency().then((value) => value.fold((l) => failureCurrency = l.message, (r) => currencyList = r));}

  setCardTaped(int index) {
    if(!this.currencyList[index].isTaped) {
      this.currencyList[index].isTaped = true;
      this.currencyList = this._currencyList.where((element) => element.currency == this.currencyList[index].currency).toList();
      notifyListeners();
    }else{
      this.currencyList.clear();
      this.getListCurrency();
    }
  }

  clear(TextEditingController textEditingController){
    textEditingController.text = "";
    this.currencyList.clear();
    notifyListeners();
  }

  searchCurrency(String search) async {
    this.currencyList.clear();
    await this.getListCurrency();
    if(currencyList.length > 1) this.currencyList = this._currencyList.where((element) => element.currency.startsWith(search.toUpperCase())).toList();
  }
}