import 'package:expense_app/auth/EmailOTPapi.dart';
import 'package:expense_app/Function.dart';
import 'package:expense_app/auth/GoogleSigning.dart';
import 'package:expense_app/LoginPage.dart';
import 'package:expense_app/auth/PhoneAuth.dart';
import 'package:expense_app/VerificationPage.dart';
import 'package:expense_app/homePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Signing extends StatelessWidget {
  Signing({super.key});

  // bool eyeView = false;
  bool isLoadingGoogle=false;

  bool isError = false;

  var NameController = TextEditingController();

  var passwordSignUpController = TextEditingController();

  var EmailSignUpController = TextEditingController();

  var mobileNumberController = TextEditingController(text: '+91');

  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<function>(context);
    apiCalling OtpVerfication = apiCalling();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 64,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ImageIcon(
            AssetImage('assets/arrow-left.png'),
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Sign Up',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
              hintText: 'Name',
              hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            controller: NameController,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 206, 201, 201),
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 206, 201, 201))),
              hintText: 'Email',
              hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            controller: EmailSignUpController,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
                ),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              suffixIcon: IconButton(
                onPressed: () {
                  // setState(() {
                  //   eyeView = !eyeView;
                  // });
                  prov.SignUpObscured(prov.eyeView2);
                },
                icon: Icon(!prov.eyeView2
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              ),
            ),
            obscureText: prov.eyeView2,
            style: const TextStyle(fontSize: 16),
            controller: passwordSignUpController,
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Checkbox(
                  value: prov.isSelected,
                  onChanged: (changedValue) {
                    // setState(() {
                    //   isSelected = !isSelected;
                    // });
                    prov.check(changedValue);
                  }),
                 
              RichText(
                text: TextSpan(
                  text: 'By signing up, you agree to the ',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Terms of\nSerivice and Privacy Policy',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color.fromRGBO(127, 61, 255, 1))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ElevatedButton(
            onPressed: () async {
          
              if (EmailSignUpController.text.isEmpty ||
                  NameController.text.isEmpty ||
                  passwordSignUpController.text.isEmpty ||
                  !prov.isSelected) {
                    
                var snackBar =
                    const SnackBar(content: Text('All fields are required'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                    prov.signUpLoading(prov.isLoading);
                // setState(() {
                //   isLoading = true;
                // });
                
                
                var id =
                    await OtpVerfication.sendingOTP(EmailSignUpController.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => verificationPage(
                      id: id,
                      name: NameController.text,
                      password: passwordSignUpController.text,
                      email: EmailSignUpController.text,
                    ),
                  ),
                );
                // setState(() {
                //   isLoading = false;
                // });
                prov.signUpLoading(prov.isLoading);
                
              }
            },
            child: prov.isLoading
                ? CircularProgressIndicator()
                : Text(
                    'Sign Up',
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
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Or with'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/flat-color-icons_google.png'),
            TextButton(
              onPressed: () async {
                   prov.googoleLoading(prov.isLoading2);
                await signInWithGoogle();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                    (route) => false);
                    // setState(() {
                    //   isLoadingGoogle=false;
                    // });
                    prov.googoleLoading(prov.isLoading2);
              },
              child: prov.isLoading2
              ?const CircularProgressIndicator(color: Colors.black,)
             : Text(
                'Sign Up with Google',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/cell-phone.png'),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) => SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
                              child: SizedBox(
                                height: 250,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    const Text(
                                      'Continue with Mobile Number',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text(
                                      'Please enter your mobile Number. We\'ll send on\nOTP to you mobile Number',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                    TextFormField(
                                        controller: mobileNumberController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          //hintText: 'Enter you\'r Mobile Number',
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        )),
                                    isError
                                        ? const Text(
                                            "Please enter your number",
                                            style: TextStyle(color: Colors.red),
                                          )
                                        : SizedBox(),
                                    ElevatedButton(
                                      onPressed: () async {
                                        if (mobileNumberController
                                                .text.isEmpty ||
                                            mobileNumberController.text.length <
                                                10) {
                                          setState(
                                            () {
                                              isError = true;
                                            },
                                          );
                                        } else {
                                          await authPhoneOTP().mobileAuth(
                                              mobileNumberController.text,
                                              context);
                                        }
                                      },
                                      child: const Text(
                                        'Continue',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: Size(360, 50),
                                        backgroundColor:
                                            Color.fromRGBO(127, 61, 255, 1),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Sign Up With Mobile',
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an account',
              style: GoogleFonts.inter(
                  color: Color.fromARGB(255, 94, 93, 93),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => loginPage(),
                    ));
              },
              child: Text('Login?',
                  style: GoogleFonts.inter(
                      color: Color.fromRGBO(127, 61, 255, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 16)),
            ),
          ],
        ),
      ]),
    );
  }
}
