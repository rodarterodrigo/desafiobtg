import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/list_currency_repository.dart';

abstract class IListCurrency{
  Future<Either<FailureCurrency, List<Currency>>>listCurrency();
}

class ListCurrency implements IListCurrency{
  final IListCurrencyRepository repository;

  ListCurrency(this.repository):assert(repository != null);

  @override
  Future<Either<FailureCurrency, List<Currency>>> listCurrency() async {
    try {
      return await repository.listCurrency();
    }
    catch(e){
      return Left(ListError(message: e.toString()));
    }
  }
}