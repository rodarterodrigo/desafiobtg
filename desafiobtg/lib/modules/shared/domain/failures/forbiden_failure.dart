import 'general_failures.dart';

class ForbidenFailure implements GeneralFailures {
  @override
  final String message;

  const ForbidenFailure(this.message);
}
