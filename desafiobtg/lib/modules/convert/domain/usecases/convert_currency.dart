import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';
import '../entities/currency.dart';
import '../repositories/convert_currency_repository.dart';

abstract class ConvertCurrencyAbstraction{
  Future<GeneralResult>call(Currency from, Currency to);
}

class ConvertCurrency implements ConvertCurrencyAbstraction{
  final ConvertCurrencyRepository repository;

  const ConvertCurrency(this.repository);

  @override
  Future<GeneralResult> call(Currency from, Currency to) => repository.convertCurrency(from, to);
}