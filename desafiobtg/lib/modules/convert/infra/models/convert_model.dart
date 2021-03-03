import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';

class ConvertModel extends Convert {
  ConvertModel({from, to}) : super(from: from, to: to);

  @override
  String toString() {
    return '{ ${this.from}, ${this.to} }';
  }

  static ConvertModel toConvert(Map<String, dynamic> map) => map == null
      ? null
      : ConvertModel(
          from: map.values.first.toDouble(), to: map.values.last.toDouble());
}
