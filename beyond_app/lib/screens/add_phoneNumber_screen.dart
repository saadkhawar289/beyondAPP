

import 'package:beyond_app/widgets/addPhoneNumberContent.dart';
import 'package:beyond_app/widgets/phoneValidationContent.dart';
import 'package:flutter/material.dart';

class AddPhoneNumber extends StatefulWidget {
  const AddPhoneNumber({Key? key}) : super(key: key);

  @override
  State<AddPhoneNumber> createState() => _AddPhoneNumberState();
}

class _AddPhoneNumberState extends State<AddPhoneNumber> {

  final PageController _pageController = PageController();
  int currentPage = 0;
  bool wilPop = false;


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
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/X_2.png',
                  ),
                  fit: BoxFit.fill,
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child:  PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      // onPageChanged: (index) {
                      //   setState(() {
                      //     _pageController.animateToPage(page, duration: duration, curve: curve)
                      //     currentPage = index;
                      //   });
                      // },
                      children: [ AddPhoneNumberContent(_pageController), const PhoneValidationContent()],
                    ) ,
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
