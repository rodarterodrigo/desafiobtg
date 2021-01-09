import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';

class CurrencyModel extends Currency{

  CurrencyModel({currency, name, isTaped}):super(currency: currency, name: name, isTaped: false);

  @override
  String toString(){
    return '{ ${this.currency}, ${this.name}, ${this.isTaped} }';
  }

  static List<CurrencyModel> toList(Map<String, dynamic> map) => map == null? null: map.entries.map((e) => CurrencyModel(currency: e.key, name: e.value,)).toList();
}