import 'currency_exceptions.dart';

class ListCurrencyException implements CurrencyExceptions{
  @override
  final String message;
  const ListCurrencyException(this.message);
}

class CurrencyConvertionException implements CurrencyExceptions {
  @override
  final String message;

  const CurrencyConvertionException(this.message);
}