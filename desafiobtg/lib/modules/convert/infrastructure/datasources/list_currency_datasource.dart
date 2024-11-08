import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

abstract class ListCurrencyDataSource{
  Future<GeneralResult> listCurrency();
}