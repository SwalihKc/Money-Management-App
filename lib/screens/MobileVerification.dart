import 'package:expense_app/auth/PhoneAuth.dart';
import 'package:expense_app/functions/Function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class MobileVerfication extends StatelessWidget {
  String verify;
  
  MobileVerfication({super.key,required this.verify});

  var mobileOtpController = TextEditingController();

  // bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<function>(context);
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
          child: ImageIcon(
            AssetImage('assets/arrow-left.png'),
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Your\nVerificationCode',
              style: GoogleFonts.inter(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(3, 14, 15, 1)),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Pinput(
                length: 6,
                controller: mobileOtpController,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: ElevatedButton(
                onPressed: () async {
                      prov.mobileVerification(prov.isLoading5);
                  await authPhoneOTP().otpVerify(mobileOtpController.text,verify,context);
                  // setState(() {
                  //   isLoading=false;
                  // });
                  prov.mobileVerification(prov.isLoading5);

                },
                child: prov.isLoading5
                ?CircularProgressIndicator()
                  : Text(
                    'Verfy',
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
            ),
          ],
        ),
      ),
    );
  }
}
