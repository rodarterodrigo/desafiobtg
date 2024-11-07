import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/failures.dart';
import 'package:desafiobtg/modules/convert/external/datasources/convert_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/ConvertDataSourceResponse.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = ConvertCurrencyDatasource(dio);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ConvertDataSourceResponse, statusCode: 200));
    final result = datasource.convertCurrency(from, to);
    expect(result, completes);
  });

  test("Deve retornar um objeto do tipo ConvertModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ConvertDataSourceResponse, statusCode: 200));
    final result = datasource.convertCurrency(from, to);
    expect(result, isA<Future<ConvertModel>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.convertCurrency(from, to);
    expect(result, throwsA(isA<DataSourceError>()));
  });
}