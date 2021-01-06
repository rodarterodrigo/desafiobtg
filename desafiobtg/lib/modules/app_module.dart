import 'package:desafiobtg/modules/app_widget.dart';
import 'package:desafiobtg/modules/convert/domain/usecases/list_currency.dart';
import 'package:desafiobtg/modules/convert/external/datasources/list_currency_datasource.dart';
import 'package:desafiobtg/modules/convert/infra/repositories/list_currency_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule{
  @override
  // TODO: implement binds
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => ListCurrencyDatasource(i())),
    Bind((i) => ListCurrencyRepository(i())),
    Bind((i) => ListCurrency(i())),
  ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => throw UnimplementedError();
}