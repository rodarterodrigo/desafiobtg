import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';

class CurrencyModel extends Currency{

  CurrencyModel({currency, name}):super(currency: currency, name: name);

  @override
  String toString(){
    return '{ ${this.currency}, ${this.name} }';
  }

  static List<CurrencyModel> toList(Map<String, dynamic> map) => map == null? null: map.entries.map((e) => CurrencyModel(currency: e.key, name: e.value)).toList();
}