import '../../../shared/infrastructure/general_exceptions.dart';

abstract class CurrencyExceptions implements GeneralExceptions{
  @override
  final String message;

  const CurrencyExceptions({required this.message});
}