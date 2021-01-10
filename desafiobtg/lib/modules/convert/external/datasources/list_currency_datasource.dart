import 'package:desafiobtg/modules/convert/external/datasources/CurrencyDataSourceResponse.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/list_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/currency_model.dart';
import 'package:dio/dio.dart';

class ListCurrencyDatasource implements IListCurrencyDataSource{
  final Dio dio;

  ListCurrencyDatasource(this.dio):assert(dio!= null);

  @override
  Future<List<CurrencyModel>> listCurrency() async{
   // final response = await dio.get("${Settings.baseUrlPrefix}/list?access_key=${Settings.ApiKey}");
   // return response.statusCode == 200? CurrencyModel.toList(response.data['currencies'] as Map): throw DataSourceError();
    return CurrencyModel.toList(ListCurrencyDatasourceResponse["currencies"] as Map);
  }
}