import 'package:dartz/dartz.dart';
import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/errors/errors.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/convert_current.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConvertCurrencyRepositoryMock extends Mock implements IConvertCurrencyRepository{}

final repository = ConvertCurrencyRepositoryMock();
final usecase = ConvertCurrency(repository);

main(){
  test("Deve retornar duas moedas e seus valores convertidos a partir do dolar.", ()async{
    when(repository.convertCurrency()).thenAnswer((realInvocation) async => Right(Convert()));
    final result = await usecase.convertCurrency();
    expect(result | null, isA<Convert>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async{
    when(repository.convertCurrency()).thenThrow(ConvertError());
    final result = await usecase.convertCurrency();
    expect(result.fold(id,id), isA<ConvertError>());
  });
}