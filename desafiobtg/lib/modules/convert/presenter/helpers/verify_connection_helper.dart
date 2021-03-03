import 'dart:io';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_toast.dart';

class VerifyConnection {
  // ignore: missing_return
  static Future<bool> verifyConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else
        return false;
      // ignore: unused_catch_clause
    } on SocketException catch (e) {
      CustomFlutterToast.alert("Verifique sua conexão");
    }
  }
}
