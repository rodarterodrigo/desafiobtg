import 'general_failures.dart';

class ReceiveTimeoutFailure implements GeneralFailures {
  @override
  final String message;

  const ReceiveTimeoutFailure(this.message);
}
