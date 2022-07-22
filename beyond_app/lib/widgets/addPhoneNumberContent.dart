import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPhoneNumberContent extends StatefulWidget {
  PageController d;
  AddPhoneNumberContent(this.d);

  @override
  State<AddPhoneNumberContent> createState() => _AddPhoneNumberContentState();
}

class _AddPhoneNumberContentState extends State<AddPhoneNumberContent> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    phoneNumberController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
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
                      'Add Phone Number',
                      style: TextStyle(
                        color: Color(0xff3ad0d6),
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Enter an active phone number. We will send a validation code to verify it\'s you',
                  style: TextStyle(
                      color: Color(0xff0D253C), fontSize: 14, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.left,
                ),

                SizedBox(
                  height: 78,
                ),


                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                          color: Colors.black87, fontSize: 16),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Expanded(
                    child: TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        fillColor: Color(0xffEEF5F9),
                        filled: true,
                        contentPadding: EdgeInsets.only(top: 10, bottom: 10),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                            BorderRadius.circular(10)),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Color(0xff3ad0d6),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Your Phone Number';
                        }
                        return null;
                      },
                    ),
                  ),
                ),



              ],
            ),
          ),
          Spacer(),
              phoneNumberController.value.text.isEmpty
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
                      Color(0xff2A9CDF).withOpacity(0.45),
                      Color(0xff00C4CC).withOpacity(0.55),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a Snackbar.
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Processing Data')
                      )
                      );
                    }
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(50))),
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
                  gradient: LinearGradient(
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
                      Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Processing Data')));
                    }
                    widget.d.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeIn);
                  },

                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Remind Later',
            style: TextStyle(
                color: Color(0xff3ad0d6),
                fontSize: 13,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: 20,
          )

        ],
      ),
    );
  }
}
