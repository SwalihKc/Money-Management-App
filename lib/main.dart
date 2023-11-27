import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:expense_app/Function.dart';
import 'package:expense_app/firebase_options.dart';
import 'package:expense_app/homePage.dart';
import 'package:expense_app/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => function(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EasySplashScreen(
          logo: Image.asset(
            "assets/montra.png",
            alignment: Alignment.center,
          ),
          logoWidth: 200,
          backgroundColor: Color.fromRGBO(127, 61, 255, 1),
          showLoader: true,
          loaderColor: Colors.white,
          durationInSeconds: 4,
          navigator: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return Center(child: CircularProgressIndicator());
              }
              final user = snapshot.data;
              if (user != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified == true) {
                print("user is logged in");
                print(user);
                return MyHomePage();
              } else {
                print("user is not logged in");
                return welcomePage();
              }
            },
          ),
        ),
        //
      ),
    );
  }
}
