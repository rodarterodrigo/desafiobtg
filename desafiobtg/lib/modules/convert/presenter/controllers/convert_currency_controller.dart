import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:flutter/material.dart';

class ConvertCurrencyController extends ChangeNotifier{
  Currency _from = new Currency();
  get from => _from;
  set from(value) { _from = value; notifyListeners(); }

  Currency _to = new Currency();
  get to => _to;
  set to(value) { _to = value; notifyListeners(); }
}