import 'package:desafiobtg/modules/convert/domain/entities/convert_entities.dart';

class Convert implements ConvertEntitiesAbstraction{
  final double from;
  final double to;

  const Convert({required this.from, required this.to});
}