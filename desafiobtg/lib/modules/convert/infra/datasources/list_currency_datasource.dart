import 'package:desafiobtg/modules/convert/infra/models/currency_model.dart';

abstract class IListCurrencyDataSource{
  Future<List<CurrencyModel>> listCurrency();
}