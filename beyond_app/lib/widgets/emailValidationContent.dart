import 'dart:async';

import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:flutter/material.dart';

class EmailValidationContent extends StatefulWidget {
  const EmailValidationContent({Key? key}) : super(key: key);

  @override
  State<EmailValidationContent> createState() => _EmailValidationContentState();
}

class _EmailValidationContentState extends State<EmailValidationContent> {

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffb5edf0)
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xffb5edf0)
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Container(
                    height: 6,
                    width: 24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color(0xff00C4CC)
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Email Validation',
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
                'We have sent a validation code at your email address. Please input below to continue.',
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
                      activeFillColor: Color(0xffEEF5F9),
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(1),
                      fieldHeight: 55,
                      activeColor: Color(0xffEEF5F9),
                      selectedFillColor: Color(0xffEEF5F9),
                      selectedColor: Color(0xffEEF5F9),
                      inactiveColor: Color(0xffEEF5F9),
                      inactiveFillColor: Color(0xffEEF5F9),
                      fieldWidth: 55,
                      errorBorderColor: Colors.redAccent
                    ),
                    cursorColor: Color(0xff3ad0d6),
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
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Group_61.png',
                                      ),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                'Account Created!',
                                style: TextStyle(
                                  color: Color(0xff3ad0d6),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'The email validation is successful. You have an option to add a phone number for quick validation and control over your account.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, '/appPhoneNumber');
                                },
                                child: Container(
                                  height: height * 0.045,
                                  width: width * 0.45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff2A9CDF),
                                        Color(0xff00C4CC),
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.pushNamed(context, '');
                                      },
                                      child: Text(
                                        'ADD PHONE',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Skip Now',
                                style: TextStyle(
                                  color: Color(0xff3ad0d6),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff2A9CDF),
                    Color(0xff00C4CC),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
              Center(
                child: Text(
                  'Change Email',
                  style: TextStyle(
                      color: Color(0xff3ad0d6),
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
          ],
        ),
      ),
    );






    //   Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(
    //           left: 30.0, right: 30.0, top: 30.0),
    //       child: Column(
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Container(
    //                 height: 6,
    //                 width: 6,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(50),
    //                     color: Color(0xffb5edf0)
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 3,
    //               ),
    //               Container(
    //                 height: 6,
    //                 width: 6,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(50),
    //                     color: Color(0xffb5edf0)
    //                 ),
    //               ),
    //               SizedBox(
    //                 width: 3,
    //               ),
    //               Container(
    //                 height: 6,
    //                 width: 24,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(45),
    //                     color: Color(0xff00C4CC)
    //                 ),
    //               ),
    //             ],
    //           ),
    //           Row(
    //             children: [
    //               Text(
    //                 'Email Validation',
    //                 style: TextStyle(
    //                   color: Color(0xff3ad0d6),
    //                   fontSize: 22,
    //                   fontWeight: FontWeight.w900,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 12,
    //           ),
    //           Text(
    //             'We have sent you a validation code at your email address. Please input below to continue',
    //             style: TextStyle(
    //                 color: Color(0xff0D253C), fontSize: 14, fontWeight: FontWeight.normal),
    //             textAlign: TextAlign.left,
    //           ),
    //
    //           SizedBox(
    //             height: 78,
    //           ),
    //
    //
    //
    //
    //
    //           Row(
    //             children: [
    //               Text(
    //                 'Validation Code',
    //                 style: TextStyle(
    //                     color: Color(0xff0D253C), fontSize: 16, fontWeight: FontWeight.w600),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 14,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Container(
    //                 height: 55,
    //                 width: 55,
    //                 color: Color(0xffEEF5F9),
    //               ),
    //               Container(
    //                 height: 55,
    //                 width: 55,
    //                 color: Color(0xffEEF5F9),
    //               ),
    //               Container(
    //                 height: 55,
    //                 width: 55,
    //                 color: Color(0xffEEF5F9),
    //               ),
    //               Container(
    //                 height: 55,
    //                 width: 55,
    //                 color: Color(0xffEEF5F9),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 14,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [
    //               Text(
    //                 'Resend Code (30)',
    //                 style: TextStyle(
    //                     color: Color(0xff3ad0d6), fontSize: 14, fontWeight: FontWeight.w600),
    //               ),
    //             ],
    //           ),
    //
    //
    //         ],
    //       ),
    //     ),
    //     Spacer(),
    //     Container(
    //       height: height * 0.05,
    //       width: width * 0.70,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(50),
    //         gradient: LinearGradient(
    //           begin: Alignment.topLeft,
    //           end: Alignment.bottomRight,
    //           colors: [
    //             Color(0xff2A9CDF),
    //             Color(0xff00C4CC),
    //           ],
    //         ),
    //       ),
    //       child: Center(
    //         child: Text(
    //           'VERIFY',
    //           style: TextStyle(
    //               fontSize: 16,
    //               color: Colors.white,
    //               fontWeight: FontWeight.w500
    //           ),
    //         ),
    //       ),
    //     ),
    //     SizedBox(
    //       height: 30,
    //     ),
    //     Text(
    //       'Change Email',
    //       style: TextStyle(
    //           color: Color(0xff3ad0d6),
    //           fontSize: 13,
    //           fontWeight: FontWeight.w600
    //       ),
    //     ),
    //     SizedBox(
    //       height: 20,
    //     )
    //
    //   ],
    // );
  }
}
