import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter/material.dart';

class PhoneValidationContent extends StatefulWidget {
  const PhoneValidationContent({Key? key}) : super(key: key);

  @override
  State<PhoneValidationContent> createState() => _PhoneValidationContentState();
}

class _PhoneValidationContentState extends State<PhoneValidationContent> {

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Phone Validation',
                style: TextStyle(
                  color: Color(0xff3ad0d6),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'We have sent a validation code at your phone number. Please input below to continue.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Validation Code',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Colors.transparent,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    obscuringCharacter: '*',

                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      if (v!.length < 3) {
                      } else {
                        return null;
                      }
                    },
                    pinTheme: PinTheme(
                        activeFillColor: const Color(0xffEEF5F9),
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(1),
                        fieldHeight: 55,
                        activeColor: const Color(0xffEEF5F9),
                        selectedFillColor: const Color(0xffEEF5F9),
                        selectedColor: const Color(0xffEEF5F9),
                        inactiveColor: const Color(0xffEEF5F9),
                        inactiveFillColor: const Color(0xffEEF5F9),
                        fieldWidth: 55,
                        errorBorderColor: Colors.redAccent
                    ),
                    cursorColor: const Color(0xff3ad0d6),
                    animationDuration: const Duration(milliseconds: 300),
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    // boxShadows: [
                    //   BoxShadow(
                    //     offset: const Offset(0, 0),
                    //     color: Color(0xffEEF5F9),
                    //     blurRadius: 20,
                    //   )
                    // ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => snackBar("OTP resend!!"),
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                        color: Color(0xff3ad0d6),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.09,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 16.0, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff2A9CDF),
                    Color(0xff00C4CC),
                  ],
                ),
              ),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        content:Container(
                          height: height * 0.44,
                          width: width,
                          child: Column(
                            children: [
                              Container(
                                height: 105,
                                width: 105,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Group_61.png',
                                      ),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Congratulations!',
                                style: TextStyle(
                                  color: Color(0xff3ad0d6),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'The phone number validation is successful. You can now continue using the app and create messages for your loved ones.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/messageScreen1');
                                },
                                child: Container(
                                  height: height * 0.045,
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff2A9CDF),
                                        Color(0xff00C4CC),
                                      ],
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/messageScreen1');
                                },
                                child: const Text(
                                  'Create Message',
                                  style: TextStyle(
                                    color: Color(0xff3ad0d6),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    );


                    formKey.currentState!.validate();
                    // conditions for validating
                    if (currentText.length != 4 ||
                        currentText != "1234") {
                      errorController!.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() => hasError = true);
                    } else {
                      setState(
                            () {
                          hasError = false;
                          snackBar("OTP Verified!!");
                        },
                      );
                    }
                  },
                  child: const Center(
                      child: Text(
                        "VERIFY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Center(
              child: Text(
                'Change Number',
                style: TextStyle(
                    color: Color(0xff3ad0d6),
                    fontSize: 13,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );

  }
}
