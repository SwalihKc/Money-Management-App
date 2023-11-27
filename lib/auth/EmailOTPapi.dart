import 'dart:convert';
import 'package:http/http.dart' as http;

class apiCalling {
  sendingOTP(email) async {
    Uri requestUrl = Uri.parse(
        'https://malluscart.online/flutter-projects/expense-app/mail-verification/mailer.php?email=$email');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
    return responseJson["id"];
  }

  verifyOtp(id, userOtp) async {
    Uri requestUrl = Uri.parse(
        'https://malluscart.online/flutter-projects/expense-app/mail-verification/verify-otp.php?id=$id&otp=$userOtp');
    final response = await http.get(requestUrl);
    var responseJson = json.decode(response.body.toString());
     print(response);
    return responseJson['status'];
  }
}
