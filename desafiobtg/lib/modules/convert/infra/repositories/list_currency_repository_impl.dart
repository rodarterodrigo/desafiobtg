import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/failures.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/list_currency_repository.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/list_currency_datasource.dart';

class ListCurrencyRepositoryImplementation implements IListCurrencyRepository{
  final IListCurrencyDataSource dataSource;

  ListCurrencyRepository(this.dataSource);

  @override
  Future<Either<FailureCurrency, List<Currency>>> listCurrency() async{
    try{
      return Right(await dataSource.listCurrency());
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError(message: e.toString()));
    }
  }
}