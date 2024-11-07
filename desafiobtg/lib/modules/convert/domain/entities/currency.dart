import 'package:desafiobtg/modules/convert/domain/entities/convert_entities.dart';

class Currency implements ConvertEntitiesAbstraction{

  final String currency;
  final String name;
  bool isTaped;

  Currency({required this.currency, required this.name, this.isTaped = false,});
}