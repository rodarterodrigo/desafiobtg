import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConvertCurrencyRepositoryMock extends Mock implements IConvertCurrencyRepository{}

final repository = ConvertCurrencyRepositoryMock();
final usecase = ConvertCurrency(repository);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main(){
  test("Deve retornar duas moedas e seus valores convertidos a partir do dolar.", ()async{
    when(repository.convertCurrency(any, any)).thenAnswer((realInvocation) async => Right(Convert()));
    final result = await usecase.convertCurrency(from, to);
    expect(result | null, isA<Convert>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async{
    when(repository.convertCurrency(any, any)).thenThrow(ConvertError());
    final result = await usecase.convertCurrency(from, to);
    expect(result.fold(id,id), isA<ConvertError>());
  });
}