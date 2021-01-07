import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';

abstract class IConvertCurrencyDataSource{
  Future<ConvertModel> convertCurrency();
}