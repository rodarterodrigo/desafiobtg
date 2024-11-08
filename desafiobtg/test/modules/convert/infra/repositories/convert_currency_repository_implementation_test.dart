import 'package:desafiobtg/modules/convert/domain/entities/convert.dart';
import 'package:desafiobtg/modules/convert/domain/entities/currency.dart';
import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/convert/infrastructure/datasources/convert_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infrastructure/exceptions/exceptions.dart';
import 'package:desafiobtg/modules/convert/infrastructure/models/convert_model.dart';
import 'package:desafiobtg/modules/convert/infrastructure/repositories/convert_currency_repository_implementation.dart';
import 'package:desafiobtg/modules/shared/domain/failures/forbiden_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/generic_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/receive_timeout_failure.dart';
import 'package:desafiobtg/modules/shared/infrastructure/forbiden_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/generic_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/receive_timeout_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../domain/usecases/convert_currency_test.dart';

class ConvertCurrencyDataSourceMock extends Mock
    implements ConvertCurrencyDataSource {}

class ConvertModelFake extends Fake implements ConvertModel {}

final datasource = ConvertCurrencyDataSourceMock();
final repository = ConvertCurrencyRepositoryImplementation(datasource);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main() {
  setUpAll(() {
    registerFallbackValue(ConvertModelFake());
    registerFallbackValue(CurrencyFake());
  });

  test(
      "Should return two convertion models with two currencies starting from dolar",
      () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenAnswer((realInvocation) async => ConvertModelFake());
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<Convert>());
  });

  test("Should return a CurrencyConvertionFailure", () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenThrow(CurrencyConvertionException('CurrencyConvertionException'));
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<CurrencyConvertionFailure>());
  });

  test("Should return a ForbidenFailure", () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenThrow(ForbidenException('ForbidenException'));
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<ForbidenFailure>());
  });

  test("Should return a ReceiveTimeOutFailure", () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenThrow(ReceiveTimeOutException('ReceiveTimeOutException'));
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<ReceiveTimeoutFailure>());
  });

  test("Should return a GenericFailure", () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenThrow(GenericException('GenericException'));
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<GenericFailure>());
  });

  test("Should return a GenericFailure", () async {
    when(() => datasource.convertCurrency(any(), any()))
        .thenThrow(Exception('GenericException'));
    final result = await repository.convertCurrency(from, to);
    expect(result, isA<GenericFailure>());
  });
}
