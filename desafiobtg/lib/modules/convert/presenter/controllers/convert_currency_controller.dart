import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/convert_currency.dart';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConvertCurrencyController extends ChangeNotifier{
  ConvertCurrency usecase = Modular.get<ConvertCurrency>();

  String _failureConvert = "";
  get failureConvert => _failureConvert;
  set failureConvert(value) => _failureConvert = value;

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) { _isLoading = value; notifyListeners();}

  Currency _from = new Currency();
  get from => _from;
  set from(value) { _from = value; notifyListeners(); }

  Currency _to = new Currency();
  get to => _to;
  set to(value) { _to = value; notifyListeners(); }

  Convert _convert = new Convert();
  get convert => _convert;
  set convert(value) { _convert = value; notifyListeners(); }

  double _convertValue = 0.0;
  get convertValue => _convertValue;
  set convertValue(value) { _convertValue = value; notifyListeners(); }

  Future getCurrencyConvert() async => await usecase.convertCurrency(this.from, this.to).then((value) => value.fold((l) => failureConvert = l.message, (r) => convert = r));
  double getConvertValue(double value, double from, double to) => ((value / to) * from);

  Future<double> getConvert(TextEditingController value) async {
    isLoading = true;
    convertValue = 0.0;
    await getCurrencyConvert();
    convertValue = getConvertValue(double.parse(value.text), convert.from, convert.to);
    isLoading = false;
  }

  commitConvert(TextEditingController valueController){
    if(from.currency == null || to.currency == null)
      CustomFlutterToast.alert("Selecione as moedas para conversão");
    else
    if(valueController.text == '')
      CustomFlutterToast.alert("Digite um valor para a conversão");
    else
      getConvert(valueController);
  }

  clear(TextEditingController textEditingController){
    textEditingController.text = "";
  }
}