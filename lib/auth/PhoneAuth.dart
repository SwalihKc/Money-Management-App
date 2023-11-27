import 'package:expense_app/MobileVerification.dart';
import 'package:expense_app/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class authPhoneOTP {
  FirebaseAuth auth = FirebaseAuth.instance;
  mobileAuth(mobileNumberController, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumberController,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MobileVerfication(
              verify: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  otpVerify(mobileOTP, id, context) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: id, smsCode: mobileOTP);

      // Sign the user in (or link) with the credential
      await auth
          .signInWithCredential(credential)
          .then((value) => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              )));
    } catch (e) {
      var snackBar = SnackBar(content: Text('please enter correct OTP'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
