abstract class FailureCurrency implements Exception{
  final dynamic message;
  FailureCurrency({this.message});
}

class ListError implements FailureCurrency{
  @override
  final dynamic message;
  ListError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "ListError";
    return "ListError: $message";
  }
}

class DataSourceError implements FailureCurrency{
  @override
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}

class ConvertError implements FailureCurrency {
  @override
  final dynamic message;

  ConvertError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "ConvertError";
    return "ConvertError: $message";
  }
}