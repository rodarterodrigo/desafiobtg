import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

import '../repositories/list_currency_repository.dart';

abstract class ListCurrencyAbstraction{
  Future<GeneralResult>listCurrency();
}

class ListCurrency implements ListCurrencyAbstraction{
  final ListCurrencyRepository repository;

  const ListCurrency(this.repository);

  @override
  Future<GeneralResult> listCurrency() async => await repository.listCurrency();
}