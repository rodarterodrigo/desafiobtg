import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';
import 'package:desafiobtg/modules/shared/domain/failures/forbiden_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/generic_failure.dart';
import 'package:desafiobtg/modules/shared/domain/failures/receive_timeout_failure.dart';
import 'package:desafiobtg/modules/shared/infrastructure/forbiden_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/generic_exception.dart';
import 'package:desafiobtg/modules/shared/infrastructure/receive_timeout_exception.dart';

import '../../domain/entities/currency.dart';
import '../../domain/repositories/convert_currency_repository.dart';
import '../datasources/convert_currency_datasource.dart';
import '../exceptions/exceptions.dart';

class ConvertCurrencyRepositoryImplementation implements ConvertCurrencyRepository{
  final ConvertCurrencyDataSource dataSource;

  const ConvertCurrencyRepositoryImplementation(this.dataSource);

  @override
  Future<GeneralResult> convertCurrency(Currency from, Currency to) async {
    try{
      return await dataSource.convertCurrency(from, to);
    }
    on CurrencyConvertionException catch(e){
      return CurrencyConvertionFailure(e.message);
    }
    on ForbidenException catch(e){
      return ForbidenFailure(e.message);
    }
    on ReceiveTimeOutException catch(e){
      return ReceiveTimeoutFailure(e.message);
    }
    on GenericException catch (e) {
      return GenericFailure(e.message);
    }
    on Exception catch(e){
      return GenericFailure(e.toString());
    }
  }
}