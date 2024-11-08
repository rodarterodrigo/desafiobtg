import 'package:desafiobtg/modules/shared/infrastructure/general_exceptions.dart';

class ForbidenException implements GeneralExceptions{
  @override
  final String message;

  const ForbidenException(this.message);
}