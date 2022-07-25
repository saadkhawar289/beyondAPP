import 'package:flutter/material.dart';

class CreateAccountContent2 extends StatefulWidget {

  PageController c;
  CreateAccountContent2(this.c);

  @override
  State<CreateAccountContent2> createState() => _CreateAccountContent2State();
}

class _CreateAccountContent2State extends State<CreateAccountContent2> {

  final _formKey = GlobalKey<FormState>();

  bool Show = true;
  bool Show2 = true;

  TextEditingController createEmailController = TextEditingController();
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    createEmailController.dispose();
    createPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffb5edf0)
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 6,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: const Color(0xff00C4CC)
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xffb5edf0)
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Create Account',
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
                        style: TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Expanded(
                        child: TextFormField(
                          controller: createEmailController,
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
                              return 'Enter email';
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
                        'Create Password',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Expanded(
                        child: TextFormField(
                          controller: createPasswordController,
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
                              return 'Create password';
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
                        'Confirm Password',
                        style: TextStyle(
                            color: Colors.black87, fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Expanded(
                        child: TextFormField(
                          controller: confirmPasswordController,
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
                              )
                          ),
                          obscureText: Show,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirm password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.09,
                  ),
                  createEmailController.value.text.isEmpty &&
                      createPasswordController.value.text.isEmpty &&
                      confirmPasswordController.value.text.isEmpty
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
                            'NEXT',
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
                              widget.c.animateToPage(2, duration: const Duration(seconds: 1), curve: Curves.easeIn);
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
                            'NEXT',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 13,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text(
                          'LOG IN',
                          style: TextStyle(
                              color: Color(0xff3ad0d6),
                              fontSize: 13,
                              fontWeight: FontWeight.w600
                          ),
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


          ],
        ),
      ),
    );
  }
}
