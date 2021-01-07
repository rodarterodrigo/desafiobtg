import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/convert_currency_datasource.dart';

class ConvertCurrencyRepository implements IConvertCurrencyRepository{
  final IConvertCurrencyDataSource dataSource;

  ConvertCurrencyRepository(this.dataSource);

  @override
  Future<Either<FailureCurrency, Convert>> convertCurrency() async {
    try{
      return Right(await dataSource.convertCurrency());
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e.toString()));
    }
  }
}