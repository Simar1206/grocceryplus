import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocceryplus/Screens/home/homepage.dart';
import 'package:grocceryplus/auth/login/login_page.dart';
import 'package:grocceryplus/auth/login/otp_input_screen.dart';
import 'package:grocceryplus/auth/login/otp_verfication_screen.dart';
import 'package:grocceryplus/auth/registration/register_page.dart';

import 'package:grocceryplus/firebase_options.dart';
import 'package:grocceryplus/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

      routes: {
        '/register_page': (context) => RegisterPage(),
        '/login_page': (context) => LoginPage(),
        '/home_page' : (context) => Homepage(),

        // '/otp_input_screen': (context) => OtpInputScreen(),
        // '/otp_verfication_screen': (context) {
        //   final args = Get.arguments as Map<String, dynamic>;
        //   final verficationId = args['verficationId'] as String;
        //   final phoneNumber = args['phoneNumber'] as String;
        // return OtpVerficationScreen(
        //   phoneNumber: phoneNumber,
        //   verficationId: verficationId,
        // );
        // },
      },
    );
  }
}
