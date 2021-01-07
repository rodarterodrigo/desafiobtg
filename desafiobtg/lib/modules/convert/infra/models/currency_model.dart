import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';

class CurrencyModel extends Currency{

  CurrencyModel({name, country}):super(name: name, country: country);

  @override
  String toString(){
    return '{ ${this.name}, ${this.country} }';
  }

  static List<CurrencyModel> toList(Map<String, dynamic> map) => map == null? null: map.entries.map((e) => CurrencyModel(name: e.key, country: e.value)).toList();
}