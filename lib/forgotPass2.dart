import 'package:expense_app/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class forgotSent extends StatelessWidget {
  const forgotSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Image.asset('assets/Ilustration4.png'),
          ),
        
          Column(
            children: [
              Text(
            'Your email is on the way',
            style: GoogleFonts.inter(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        
          Center(
            child: Text(
              'Check your email test@test.com and\n follow the instructions to reset your\n password',
              style:
                  GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
            ],
          ),
         
          ElevatedButton(
            onPressed: () {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginPage(),
                  ));
            },
            child: Text(
              'Back to Login',
              style:
                  GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
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
    );
  }
}
