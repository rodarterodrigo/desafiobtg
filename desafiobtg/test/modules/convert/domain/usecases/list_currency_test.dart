import 'package:desafiobtg/modules/convert/domain/entities/currencies.dart';
import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/convert/domain/repositories/list_currency_repository.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/list_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ListCurrencyRepositoryMock extends Mock
    implements ListCurrencyRepository {}

class CurrenciesFake extends Fake implements Currencies{}

final repository = ListCurrencyRepositoryMock();
final usecase = ListCurrency(repository);

main() {
  setUpAll((){
    registerFallbackValue(CurrenciesFake());
  });
  test("Should return a currency list and your names.", () async {
    when(() => repository.listCurrency())
        .thenAnswer((realInvocation) async => CurrenciesFake());
    final result = await usecase.listCurrency();
    expect(result, isA<Currencies>());
  });

  test("Should return a list currency failure", () async {
    when(() => repository.listCurrency())
        .thenAnswer((realInvocation) async => ListCurrencyFailure('ListCurrencyFailure'));
    final result = await usecase.listCurrency();
    expect(result, isA<ListCurrencyFailure>());
  });
}
