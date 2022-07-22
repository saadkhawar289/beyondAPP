import 'package:beyond_app/screens/add_phoneNumber_screen.dart';
import 'package:beyond_app/screens/login_screen.dart';
import 'package:beyond_app/screens/messages_screen1.dart';
import 'package:beyond_app/screens/sign_up_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:beyond_app/screens/splash_screen.dart';


void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const    MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff3ad0d6),
        fontFamily: 'Nexa',
      ),
      routes: {
        '/': (context) =>  const SplashScreen(),
        '/login': (context) => const Login(),
        '/signUp': (context) => const SignUp(),
        '/appPhoneNumber': (context) => const AddPhoneNumber(),
        '/messageScreen1': (context) => const Messages(),

      },
    );
  }
}