import 'package:expense_app/screens/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FireBaseAuth {
  createUserWithEmailAndPassword(
      String fullName, String password, String emailAddress, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      //  FirStore dataSave=FirStore(fullName,emailAddress);
      // dataSave.fireStore();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');
        var snackBar =
            SnackBar(content: Text('The password provided is too weak.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        var snackBar = SnackBar(
            content: Text('The account already exists for that email.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      // print(e);
    }
  }

  Future<String> logInUser(
      {required String email, required String password, context}) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
            (route) => false);

        result = 'success';
      }
    } catch (err) {
      result = err.toString();
      var snackBar = SnackBar(content: Text('Invalid email'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return result;
  }
}
