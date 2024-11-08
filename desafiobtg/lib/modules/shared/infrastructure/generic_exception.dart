import 'package:desafiobtg/modules/shared/infrastructure/general_exceptions.dart';

class GenericException implements GeneralExceptions {
  @override
  final String message;

  const GenericException(this.message);
}
