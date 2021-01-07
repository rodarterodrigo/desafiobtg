import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/list_currency_repository.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/list_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class ListCurrencyRepositoryMock extends Mock implements IListCurrencyRepository{}

final repository = ListCurrencyRepositoryMock();
final usecase = ListCurrency(repository);

main(){
  test("Deve retornar uma lista de moedas e seus nomes.", ()async{
    when(repository.listCurrency()).thenAnswer((realInvocation) async => Right(List<Currency>()));
    final result = await usecase.listCurrency();
    expect(result | null, isA<List<Currency>>());
  });

  test("Deve retornar uma exceção do tipo ListError", () async{
    when(repository.listCurrency()).thenThrow(ListError());
    final result = await usecase.listCurrency();
    expect(result.fold(id,id), isA<ListError>());
  });
}