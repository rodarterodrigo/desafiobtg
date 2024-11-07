import '../entities/general_response.dart';

abstract class GeneralFailures implements GeneralResult {
  final String message;

  const GeneralFailures(this.message);
}
