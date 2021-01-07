import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/convert_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/convert_model.dart';
import 'package:desafiobtg/modules/convert/infra/repositories/convert_currency_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConvertCurrencyDataSourceMock extends Mock implements IConvertCurrencyDataSource{}

final datasource = ConvertCurrencyDataSourceMock();
final repository = ConvertCurrencyRepository(datasource);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main(){
  test("Deve retornar um modelo de conversão com 2 moedas a partir do dolar", () async{
    when(datasource.convertCurrency(any, any)).thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(from, to);
    expect(result | null, isA<Convert>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async{
    when(datasource.convertCurrency(any, any)).thenThrow(DataSourceError());
    final result = await repository.convertCurrency(from, to);
    expect(result.fold(id,id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async{
    when(datasource.convertCurrency(any, any)).thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(null, to);
    expect(result.fold(id,id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async{
    when(datasource.convertCurrency(any, any)).thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(from, null);
    expect(result.fold(id,id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async{
    when(datasource.convertCurrency(any, any)).thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(null, null);
    expect(result.fold(id,id), isA<DataSourceError>());
  });
}