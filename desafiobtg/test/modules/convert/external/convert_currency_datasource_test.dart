import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/external/datasources/convert_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/ConvertDataSourceResponse.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = ConvertCurrencyDatasource(dio);

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ConvertDataSourceResponse, statusCode: 200));
    final result = datasource.convertCurrency();
    expect(result, completes);
  });

  test("Deve retornar um objeto do tipo ConvertModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ConvertDataSourceResponse, statusCode: 200));
    final result = datasource.convertCurrency();
    expect(result, isA<Future<ConvertModel>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.convertCurrency();
    expect(result, throwsA(isA<DataSourceError>()));
  });
}