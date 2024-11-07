import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

abstract class CurrencyFailures implements GeneralResult{
  final String message;

  const CurrencyFailures(this.message);
}