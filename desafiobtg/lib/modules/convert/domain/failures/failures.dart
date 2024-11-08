import 'package:desafiobtg/modules/convert/domain/failures/currency_failures.dart';

class ListCurrencyFailure implements CurrencyFailures{
  @override
  final String message;
  const ListCurrencyFailure(this.message);
}

class CurrencyConvertionFailure implements CurrencyFailures {
  @override
  final String message;

  const CurrencyConvertionFailure(this.message);
}