import 'package:desafiobtg/modules/convert/domain/failures/failures.dart';
import 'package:desafiobtg/modules/convert/infrastructure/exceptions/exceptions.dart';
import 'package:desafiobtg/modules/shared/domain/entities/general_response.dart';

import '../../../shared/domain/failures/forbiden_failure.dart';
import '../../../shared/domain/failures/generic_failure.dart';
import '../../../shared/domain/failures/receive_timeout_failure.dart';
import '../../../shared/infrastructure/forbiden_exception.dart';
import '../../../shared/infrastructure/generic_exception.dart';
import '../../../shared/infrastructure/receive_timeout_exception.dart';
import '../../domain/repositories/list_currency_repository.dart';
import '../datasources/list_currency_datasource.dart';

class ListCurrencyRepositoryImplementation implements ListCurrencyRepository{
  final ListCurrencyDataSource dataSource;

  const ListCurrencyRepositoryImplementation(this.dataSource);

  @override
  Future<GeneralResult> listCurrency() async{
    try{
      return await dataSource.listCurrency();
    }
    on ListCurrencyException catch(e){
      return ListCurrencyFailure(e.message);
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