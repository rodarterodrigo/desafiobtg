import 'package:desafiobtg/modules/convert/domain/entities/convert_entities.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';

class Currencies implements ConvertEntitiesAbstraction{
  final List<Currency> currencies;

  const Currencies({required this.currencies});
}