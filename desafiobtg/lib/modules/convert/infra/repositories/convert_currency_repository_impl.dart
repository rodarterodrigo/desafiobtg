import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/failures.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/convert_currency_datasource.dart';

class ConvertCurrencyRepositoryImplementation implements IConvertCurrencyRepository{
  final IConvertCurrencyDataSource dataSource;

  ConvertCurrencyRepository(this.dataSource);

  @override
  Future<Either<FailureCurrency, Convert>> convertCurrency(Currency from, Currency to) async {
    try{
      return from == null? Left(DataSourceError(message: "A moeda de origem não pode ser nula.")): to == null?
                           Left(DataSourceError(message: "A moeda de destino não pode ser nula.")):
                           Right(await dataSource.convertCurrency(from, to));
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e.toString()));
    }
  }
}