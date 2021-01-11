import 'dart:io';
import 'package:desafiobtg/modules/convert/presenter/shared/widgets/custom_toast.dart';
class VerifyConnection {

  static Future<bool> verifyConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }else
      return false;
    } on SocketException catch (e) {
      CustomFlutterToast.alert("Verifique sua conexão");
    }
  }
}