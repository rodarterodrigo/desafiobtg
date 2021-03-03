class Settings {
  static final Settings _singleton = Settings._internal();

  factory Settings() {
    return _singleton;
  }

  Settings._internal();

  static String baseUrlPrefix = 'http://api.currencylayer.com/';
  // ignore: non_constant_identifier_names
  static String ApiKey = 'bc1f7b707b2e6244094ff1761c2c55c5';
}
