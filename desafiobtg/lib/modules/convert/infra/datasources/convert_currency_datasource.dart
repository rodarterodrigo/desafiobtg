import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';

abstract class IConvertCurrencyDataSource{
  Future<ConvertModel> convertCurrency(Currency from, Currency to);
}