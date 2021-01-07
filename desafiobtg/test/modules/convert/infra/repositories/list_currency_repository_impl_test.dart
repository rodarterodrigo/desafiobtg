import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/infra/datasources/list_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/models/currency_model.dart';
import 'package:desafiobtg/modules/convert/infra/repositories/list_currency_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListCurrencyDataSourceMock extends Mock implements IListCurrencyDataSource{}

final datasource = ListCurrencyDataSourceMock();
final repository = ListCurrencyRepository(datasource);

main(){
  test("Deve retornar uma lista de moedas e seus nomes", () async{
    when(datasource.listCurrency()).thenAnswer((realInvocation) async => List<CurrencyModel>());
    final result = await repository.listCurrency();
    expect(result | null, isA<List<Currency>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async{
    when(datasource.listCurrency()).thenThrow(DataSourceError());
    final result = await repository.listCurrency();
    expect(result.fold(id,id), isA<DataSourceError>());
  });
}