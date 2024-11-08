import 'general_exceptions.dart';

class ReceiveTimeOutException implements GeneralExceptions {
  @override
  final String message;

  const ReceiveTimeOutException(this.message);
}
