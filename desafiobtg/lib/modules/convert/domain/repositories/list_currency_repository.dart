import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';

abstract class IListCurrencyRepository{
  Future<Either<FailureCurrency, List<Currency>>> listCurrency();
}