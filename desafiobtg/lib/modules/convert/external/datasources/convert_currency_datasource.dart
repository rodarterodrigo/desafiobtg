import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/external/constants/settings.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/convert_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';
import 'package:dio/dio.dart';

class ConvertCurrencyDatasource implements IConvertCurrencyDataSource{
  final Dio dio;

  ConvertCurrencyDatasource(this.dio):assert(dio!= null);

  @override
  Future<ConvertModel> convertCurrency() async{
    final response = await dio.get("${Settings.baseUrlPrefix}/list?access_key=${Settings.ApiKey}");
    return response.statusCode == 200? ConvertModel.toCurrency(response.data['quotes'] as Map): throw DataSourceError();
  }
}