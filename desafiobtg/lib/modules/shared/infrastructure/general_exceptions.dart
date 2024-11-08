import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

abstract class GeneralExceptions implements GeneralResult{
  final String message;

  const GeneralExceptions({required this.message});
}