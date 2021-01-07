import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/external/datasources/list_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/currency_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/CurrencyDataSourceResponse.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = ListCurrencyDatasource(dio);

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListCurrencyDatasourceResponse, statusCode: 200));
    final result = datasource.listCurrency();
    expect(result, completes);
  });

  test("Deve retornar uma lista do tipo CurrencyModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListCurrencyDatasourceResponse, statusCode: 200));
    final result = datasource.listCurrency();
    expect(result, isA<Future<List<CurrencyModel>>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.listCurrency();
    expect(result, throwsA(isA<DataSourceError>()));
  });
}