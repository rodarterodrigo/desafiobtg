import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/convert_currency.dart';
import 'package:desafiobtg/modules/convert/infra/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConvertCurrencyController extends ChangeNotifier{
  ConvertCurrency usecase = Modular.get<ConvertCurrency>();

  String _failureConvert = "";
  get failureConvert => _failureConvert;
  set failureConvert(value) => _failureConvert = value;

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
  set convertValue(value) { _convertValue = value == 1? value = 1.0: value; notifyListeners(); }

  Future getCurrencyConvert() async => await usecase.convertCurrency(this.from, this.to).then((value) => value.fold((l) => failureConvert = l.message, (r) => convert = r));
  double getConvertValue(double value, double from, double to) => ((value / to) * from);

  Future<double> getConvert() async {
    convertValue = 0.0;
    await getCurrencyConvert();
    convertValue = getConvertValue(1, convert.from, convert.to);
  }
}