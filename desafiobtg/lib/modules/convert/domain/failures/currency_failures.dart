import 'package:desafiobtg/modules/shared/domain/failures/general_failures.dart';

abstract class CurrencyFailures implements GeneralFailures{
  final String message;

  const CurrencyFailures(this.message);
}