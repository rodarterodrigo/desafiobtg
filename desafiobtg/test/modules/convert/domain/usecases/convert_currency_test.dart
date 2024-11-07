import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/convert_currency_repository.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/convert_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConvertCurrencyRepositoryMock extends Mock implements ConvertCurrencyRepository{}
class ConvertFake extends Fake implements Convert{}
class CurrencyFake extends Fake implements Currency{}

final ConvertCurrencyRepository repository = ConvertCurrencyRepositoryMock();
final ConvertCurrency usecase = ConvertCurrency(repository);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main(){
  setUpAll((){
    registerFallbackValue(ConvertFake());
    registerFallbackValue(CurrencyFake());
  });

  test("Should return both currencies and converted values on Convert entity.", ()async{
    when(() => repository.convertCurrency(any(), any()))
        .thenAnswer((realInvocation) async => ConvertFake());
    final result = await usecase(from, to);
    expect(result, isA<Convert>());
  });

  test("Should return a CurrencyConvertionFailure", () async{
    when(() => repository.convertCurrency(any(), any()))
        .thenAnswer((realInvocation) async => CurrencyConvertionFailure('CurrencyConvertionFailure'));
    final result = await usecase(from, to);
    expect(result, isA<CurrencyConvertionFailure>());
  });
}