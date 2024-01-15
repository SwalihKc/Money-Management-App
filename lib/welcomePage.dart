import 'package:expense_app/Function.dart';
import 'package:expense_app/LoginPage.dart';
import 'package:expense_app/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<function>(context);
    List<Image> sliderImages = [
      Image.asset('assets/Illustration.png'),
      Image.asset("assets/Illustration2.png"),
      Image.asset("assets/Illustration3.png"),
    ];
    List<String> MainText = [
      "Gain total control\nof your money\n",
      "Know where your\nmoney goes\n",
      "Planning ahead\n"
    ];
    List<String> Textdiscription = [
      "Become your own money manager\nand make every cent count",
      "Track your transaction easily,\nwith categories and financial report ",
      "Setup your budget for each category\nso you in control"
    ];
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: CarouselSlider.builder(
              enableAutoSlider: true,
              unlimitedMode: true,
              autoSliderDelay: Duration(seconds: 2),
              slideIndicator: CircularSlideIndicator(
                alignment: AlignmentDirectional.bottomCenter,
                padding: EdgeInsets.only(bottom: 20),
                currentIndicatorColor: Color.fromRGBO(127, 61, 255, 1),
              ),
              slideBuilder: (index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 360,
                      child: sliderImages[index],
                    ),
                    Text(
                      MainText[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    Text(
                      Textdiscription[index],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                );
              },
              itemCount: sliderImages.length,
            ),
          ),
     const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ElevatedButton(
              onPressed: () {
                prov.welcomeSignUpLoading(prov.isLoading3);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signing(),
                    ));
                     prov.welcomeSignUpLoading(prov.isLoading3);
              },
             
              child:prov.isLoading3?
              CircularProgressIndicator()
               :Text(
                'Sign Up',
                style: TextStyle(fontSize: 17),
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
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Login',
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(127, 61, 255, 1))),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(360, 50),
                  backgroundColor: Color.fromARGB(147, 250, 252, 252),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text('Login',
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(127, 61, 255, 1)))),
          ),
        ],
      ),
    );
  }
}
