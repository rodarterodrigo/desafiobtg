import 'package:desafiobtg/modules/convert/domain/entities/currencies.dart';
import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/convert/infrastructure/datasources/list_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infrastructure/exceptions/exceptions.dart';
import 'package:desafiobtg/modules/convert/infrastructure/repositories/list_currency_repository_implementation.dart';
import 'package:desafiobtg/modules/shared/domain/failures/forbiden_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/generic_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/receive_timeout_failure.dart';
import 'package:desafiobtg/modules/shared/infrastructure/forbiden_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/generic_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/receive_timeout_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/usecases/convert_currency_test.dart';

class ListCurrencyDataSourceMock extends Mock
    implements ListCurrencyDataSource {}

class CurrenciesFake extends Fake implements Currencies {}

final datasource = ListCurrencyDataSourceMock();
final repository = ListCurrencyRepositoryImplementation(datasource);

main() {
  setUpAll(() {
    registerFallbackValue(CurrenciesFake());
    registerFallbackValue(CurrencyFake());
  });
  test("Should return a currency list and your names", () async {
    when(() => datasource.listCurrency())
        .thenAnswer((realInvocation) async => CurrenciesFake());
    final result = await repository.listCurrency();
    expect(result, isA<Currencies>());
  });

  test("Should return a ListCurrencyFailure", () async {
    when(() => datasource.listCurrency())
        .thenThrow(ListCurrencyException('ListCurrencyException'));
    final result = await repository.listCurrency();
    expect(result, isA<ListCurrencyFailure>());
  });

  test("Should return a ForbidenFailure", () async {
    when(() => datasource.listCurrency())
        .thenThrow(ForbidenException('ForbidenException'));
    final result = await repository.listCurrency();
    expect(result, isA<ForbidenFailure>());
  });

  test("Should return a ReceiveTimeoutFailure", () async {
    when(() => datasource.listCurrency())
        .thenThrow(ReceiveTimeOutException('ReceiveTimeOutException'));
    final result = await repository.listCurrency();
    expect(result, isA<ReceiveTimeoutFailure>());
  });

  test("Should return a GenericFailure", () async {
    when(() => datasource.listCurrency())
        .thenThrow(GenericException('GenericException'));
    final result = await repository.listCurrency();
    expect(result, isA<GenericFailure>());
  });

  test("Should return a GenericFailure", () async {
    when(() => datasource.listCurrency()).thenThrow(Exception('Exception'));
    final result = await repository.listCurrency();
    expect(result, isA<GenericFailure>());
  });
}
