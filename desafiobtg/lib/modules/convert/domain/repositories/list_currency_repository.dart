import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

abstract class ListCurrencyRepository{
  Future<GeneralResult> listCurrency();
}