import 'package:expense_app/auth/firebaseAuth.dart';
import 'package:expense_app/forgotPass2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forget extends StatelessWidget {
  Forget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 64,
        title: Text(
          'forgot Password',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: ImageIcon(
            AssetImage('assets/arrow-left.png'),
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'Don’t worry.\nEnter your email and we’ll\nsend you a link to reset your password.',
              style:
                  GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: restEmailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 206, 201, 201),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 206, 201, 201),
                    )),
                hintText: 'Email',
                hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                resetPassword(restEmailController.text);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => forgotSent(),
                    ));
              },
              child: Text(
                'Continue',
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(360, 50),
                backgroundColor: Color.fromRGBO(127, 61, 255, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.sendPasswordResetEmail(email: email);
  }

  FireBaseAuth auth = FireBaseAuth();
}

var restEmailController = TextEditingController();
