import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool Show = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                image: const DecorationImage(
              image: AssetImage(
                'assets/images/X_1.png',
              ),
              fit: BoxFit.fill,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28))),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30.0, top: 30.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'LOG IN',
                                          style: TextStyle(
                                            color: Color(0xff3ad0d6),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 26,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                              color: Colors.black87, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: Color(0xffEEF5F9),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(top: 15),
                                          constraints: BoxConstraints.expand(height: 42),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          prefixIcon: Icon(
                                            Icons.mail,
                                            color: Color(0xff3ad0d6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Password',
                                          style: TextStyle(
                                              color: Colors.black87, fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffEEF5F9),
                                            filled: true,
                                            contentPadding: EdgeInsets.only(top: 15),
                                            constraints: BoxConstraints.expand(height: 42),
                                            border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Color(0xff3ad0d6),
                                            ),
                                            suffixIcon: Show
                                                ? InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        Show = false;
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.visibility_off,
                                                        color: Colors.black54),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        Show = true;
                                                      });
                                                    },
                                                    child: const Icon(
                                                        Icons.visibility,
                                                        color: Colors.black54),
                                                  )),
                                        obscureText: Show,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                              color: Color(0xff3ad0d6),
                                              fontSize: 14,
                                            fontWeight: FontWeight.normal
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: height * 0.05,
                                      width: width * 0.70,
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
                                        child: Text(
                                          'LOG IN',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 1,
                                      child: Divider(
                                        height: 20,
                                        color: Color(0xffC0D5DB),
                                      ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                      'OR',
                                    style: TextStyle(
                                      color: Color(0xffC0D5DB),
                                      fontSize: 16
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Divider(
                                        height: 20,
                                        color: Color(0xffC0D5DB),
                                      ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                          'assets/images/Google.png',
                                        ),
                                        fit: BoxFit.cover,
                                    ),
                                  ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: const AssetImage(
                                          'assets/images/Facebook.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account? ',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, '/signUp');
                                    },
                                    child: Text(
                                      'CREATE',
                                      style: TextStyle(
                                          color: Color(0xff3ad0d6),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              )

                            ],
                          ),
                        ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
