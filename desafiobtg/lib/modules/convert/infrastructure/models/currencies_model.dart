import 'package:desafiobtg/modules/convert/domain/entities/currencies.dart';

import 'currency_model.dart';

class CurrenciesModel extends Currencies{
  const CurrenciesModel({required super.currencies});

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) =>
      CurrenciesModel(currencies: json.entries.map((e)
          => CurrencyModel(currency: e.key, name: e.value,)).toList());
}