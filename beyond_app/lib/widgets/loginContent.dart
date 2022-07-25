import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  bool Show = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28), topRight: Radius.circular(28),
        ),
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
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
                    const SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Email',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Expanded(
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffEEF5F9),
                              filled: true,
                              contentPadding:
                              const EdgeInsets.only(top: 10, bottom: 10),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Color(0xff3ad0d6),
                              ),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Your email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: const [
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                                fillColor: const Color(0xffEEF5F9),
                                filled: true,
                                contentPadding:
                                const EdgeInsets.only(top: 10, bottom: 10),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                prefixIcon: const Icon(
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
                                  child: const Icon(Icons.visibility_off,
                                      color: Colors.black54),
                                )
                                    : InkWell(
                                  onTap: () {
                                    setState(() {
                                      Show = true;
                                    });
                                  },
                                  child: const Icon(Icons.visibility,
                                      color: Colors.black54),
                                )),
                            obscureText: Show,
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Your password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){

                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color(0xff3ad0d6),
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    emailController.value.text.isEmpty &&
                        passwordController.value.text.isEmpty
                        ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                        height: height * 0.05,
                        width: width * 0.70,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xff2A9CDF).withOpacity(0.45),
                                const Color(0xff00C4CC).withOpacity(0.55),
                              ],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(const SnackBar(
                                    content: Text('Processing Data')
                                )
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(50))),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                        : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: SizedBox(
                        height: height * 0.05,
                        width: width * 0.70,
                        child: DecoratedBox(
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
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a Snackbar.
                                Scaffold.of(context).showSnackBar(const SnackBar(
                                    content: Text('Processing Data')));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(50),
                              ),
                            ),
                            child: const Text(
                              'LOG IN',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
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
                    style: TextStyle(color: Color(0xffC0D5DB), fontSize: 16),
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Google.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
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
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: const Text(
                      'CREATE',
                      style: TextStyle(
                          color: Color(0xff3ad0d6),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
