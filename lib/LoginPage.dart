import 'package:expense_app/Function.dart';
import 'package:expense_app/auth/firebaseAuth.dart';
import 'package:expense_app/forgetPassword.dart';
import 'package:expense_app/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});
  var EmailLoginController = TextEditingController();

  var PasswordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FireBaseAuth PasswordAuthentication = FireBaseAuth();
    final prov=Provider.of<function>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 64,
        title: Text(
          'Login',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ImageIcon(
            AssetImage('assets/arrow-left.png'),
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 206, 201, 201),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 206, 201, 201),
                      )),
                  hintText: 'Email',
                  hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                controller: EmailLoginController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25,right: 10,left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 206, 201, 201),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 206, 201, 201),
                      )),
                  hintText: 'Password',
                  hintStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // setState(() {
                      //   eyeView = !eyeView;
                      // });
                      
                       prov.LoginisObscured(prov.eyeView);
                    },
                    icon: Icon(prov.eyeView
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                ),
                obscureText: prov.eyeView,
                style: const TextStyle(fontSize: 16),
                controller: PasswordLoginController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await PasswordAuthentication.logInUser(
                      email: EmailLoginController.text,
                      password: PasswordLoginController.text,
                      context: context);
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(360, 50),
                  backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
              onPressed: () {
                
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Forget(),
                    ));
              },
              child: Text(
                'Forget password?',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(127, 61, 255, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account yet?',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Signing(),
                        ));
                  },
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color.fromRGBO(127, 61, 255, 1),
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
