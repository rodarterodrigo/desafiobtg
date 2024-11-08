import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

abstract class ConvertCurrencyDataSource{
  Future<GeneralResult> convertCurrency(Currency from, Currency to);
}