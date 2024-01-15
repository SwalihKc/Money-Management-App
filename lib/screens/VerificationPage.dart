import 'package:expense_app/auth/EmailOTPapi.dart';
import 'package:expense_app/auth/firebaseAuth.dart';
import 'package:expense_app/functions/Function.dart';
import 'package:expense_app/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage(
      {super.key,
      required this.id,
      required this.name,
      required this.password,
      required this.email});
  final id;
  final String name;
  final String password;
  final String email;

  var otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    apiCalling OtpVerfication = apiCalling();
    final prov = Provider.of<function>(context);

    FireBaseAuth passwordAuthentication = FireBaseAuth();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 64,
        title: Text(
          'Verification',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 130,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  'Enter your\nVerification Code',
                  style: GoogleFonts.inter(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(3, 14, 15, 1)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80),
                child: Pinput(
                  controller: otpController,
                  onSubmitted: (value) => otpController.text,
                ),
              ),
              // RichText(
              //   text: TextSpan(
              //     text: '\n04:59\n',
              //     style: GoogleFonts.inter(
              //         color: Color.fromRGBO(127, 61, 255, 1),
              //         fontWeight: FontWeight.w600,
              //         fontSize: 18),
              RichText(
                text: TextSpan(
                  text: '\nWe send verification code to your\nemail ',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'brajaoma*****@gmail.com.',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color.fromRGBO(127, 61, 255, 1),
                      ),
                    ),
                    TextSpan(
                      text: 'You can\nCheck Your inbox.',
                      style: GoogleFonts.inter(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const TextSpan(
                      text: '\n\nI didn’t received the code? Send again ',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(127, 61, 255, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 12),
                child: ElevatedButton(
                  onPressed: () async {
                    // setState(() {
                    //   isLoadingverification = true;
                    // });
                    prov.verifcationLoading(prov.isLoading4);

                    print(id);
                    var status =
                        await OtpVerfication.verifyOtp(id, otpController.text);
                    if (status == 'success') {
                      await passwordAuthentication
                          .createUserWithEmailAndPassword(
                              name, password, email, context);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                          (route) => false);
                    } else {
                      prov.verifcationLoading(prov.isLoading4);
                      var snackBar =
                          const SnackBar(content: Text('Incorrect OTP'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    // setState(() {
                    //   isLoadingverification = false;
                    // });
                    prov.verifcationLoading(prov.isLoading4);
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(360, 50),
                    backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: prov.isLoading4
                      ? const CircularProgressIndicator()
                      : Text(
                          'Verify',
                          style: GoogleFonts.inter(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
