import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';

class ConvertModel extends Convert {
  ConvertModel({required super.from, required super.to});


  static ConvertModel fromJson(Map<String, dynamic> map) => ConvertModel(
          from: map.values.first.toDouble(), to: map.values.last.toDouble());
}