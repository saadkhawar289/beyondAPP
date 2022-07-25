import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class CreateAccountContent1 extends StatefulWidget {
  PageController c;
  CreateAccountContent1(this.c);

  @override
  State<CreateAccountContent1> createState() => _CreateAccountContent1State();
}

class _CreateAccountContent1State extends State<CreateAccountContent1> {
  String? dropdownValue;


  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  final dateController = TextEditingController();
  final validateController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    nameController.dispose();
    dateController.dispose();
    validateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
              Column(
                children: [
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
                        'Full Name',
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
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xffEEF5F9),
                            filled: true,
                            contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(12)),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xff3ad0d6),
                            ),
                          ),

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Your Name';
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
                        'Birthday',
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
                          readOnly: true,
                          controller: dateController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xffEEF5F9),
                            filled: true,
                            contentPadding: const EdgeInsets.only(top: 10, bottom: 10),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(12)),
                            prefixIcon: const Icon(
                              Icons.calendar_today,
                              color: Color(0xff3ad0d6),
                            ),
                          ),
                          onTap: () async {
                            var date =  await showDatePicker(
                                context: context,
                                initialDate:DateTime.now(),
                                firstDate:DateTime(1900),
                                lastDate: DateTime(2100));
                            dateController.text = date.toString().substring(0,10);
                          },

                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'DOB';
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
                        'Frequency of Validation',
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
                        child: DropDownTextField(
                          // initialValue: "name4",
                          listSpace: 8,
                          listPadding: ListPadding(top: 20),

                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownList: const [
                            DropDownValueModel(name: '1 Month', value: "value1"),
                            DropDownValueModel(name: '3 Months', value: "value2"),
                            DropDownValueModel(name: '6 Months', value: "value3"),
                          ],

                          listTextStyle: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal,

                          ),
                          dropDownItemCount: 3,
                          dropdownRadius: 5,
                          clearOption: false,

                          textFieldDecoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffEEF5F9),
                            contentPadding: const EdgeInsets.only(top: 10, left: 16),
                            hintText: 'Select...',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.circular(12)),
                          ),

                          onChanged: (val) {},

                        ),
                      ),
                    ),
                  ),


                  // DropdownButton(
                  //   isExpanded: true,
                  //   value: dropdownvalue,
                  //   icon: Icon(Icons.keyboard_arrow_down),
                  //   items:items.map((String items) {
                  //     return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items)
                  //     );
                  //   }
                  //   ).toList(),
                  //   onChanged: (String? newValue){
                  //     setState(() {
                  //       dropdownvalue = newValue!;
                  //     });
                  //   },
                  // ),

                  // DropdownButton<String>(
                  //   value: dropdownValue,
                  //   focusColor: Color(0xffEEF5F9),
                  //   hint: Text('Select a color'),
                  //   icon: const Icon(Icons.arrow_drop_down),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownValue = newValue!;
                  //     });
                  //   },
                  //   items: <String>['Red', 'Green', 'Blue']
                  //       .map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  // ),


                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Frequency at which we\'ll check on you to know if we should send out your Messages or not.',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  nameController.value.text.isEmpty &&
                      dateController.value.text.isEmpty
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
                            }
                            widget.c.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeIn);
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
                    height: 10,
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
