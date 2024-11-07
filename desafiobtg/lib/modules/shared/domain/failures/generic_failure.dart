import 'general_failures.dart';

class GenericFailure implements GeneralFailures {
  @override
  final String message;

  const GenericFailure(this.message);
}
