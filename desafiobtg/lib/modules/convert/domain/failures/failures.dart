import 'package:desafiobtg/modules/convert/domain/failures/currency_failures.dart';

class ListCurrencyFailure implements CurrencyFailures{
  @override
  final String message;
  const ListCurrencyFailure(this.message);
}

class CurrencyDatasourceFailure implements CurrencyFailures{
  @override
  final String message;
  const CurrencyDatasourceFailure(this.message);
}

class CurrencyConvertionFailure implements CurrencyFailures {
  @override
  final String message;

  const CurrencyConvertionFailure(this.message);
}