import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';

abstract class IConvertCurrency{
  Future<Either<FailureCurrency, Convert>>convertCurrency();
}

class ConvertCurrency implements IConvertCurrency{
  final IConvertCurrencyRepository repository;

  ConvertCurrency(this.repository):assert(repository != null);

  @override
  Future<Either<FailureCurrency, Convert>> convertCurrency() async{
    try {
      return await repository.convertCurrency();
    }
    catch(e){
      return Left(ConvertError(message: e.toString()));
    }
  }
}