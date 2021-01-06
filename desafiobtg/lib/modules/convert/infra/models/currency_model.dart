import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';

class CurrencyModel extends Currency{

  CurrencyModel({name, country}):super(name: name, country: country);

  @override
  String toString(){
    return '{ ${this.name}, ${this.country} }';
  }

  Map<String, dynamic> toMap(){
    return{
      "name":name,
      "country":country,
    };
  }

  static List<CurrencyModel> toList(Map<String, dynamic> map){
    List<CurrencyModel> list = new List<CurrencyModel>();
    if(map == null) return null;
    map.forEach((key, value) => list.add(CurrencyModel(name: key, country: value)));
    return list;
  }
}