import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slidable_button/slidable_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),(){
      Navigator.pushNamed(context, '/login');
    });
    super.initState();
  }

//Variable to assist the slider option to go further over to the next screen
  var result;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: const AssetImage(
                      'assets/images/Splash.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.8), BlendMode.lighten),
                  )),
            ),
          )),
    );
  }
}
