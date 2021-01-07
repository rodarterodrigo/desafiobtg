import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';

abstract class IConvertCurrencyRepository{
  Future<Either<FailureCurrency, Convert>> convertCurrency();
}