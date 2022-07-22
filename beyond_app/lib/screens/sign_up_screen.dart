// Stack(
// children: [
// PageView(
// controller: _pageController,
// onPageChanged: (index) {
// setState(() {
// currentPage = index;
// });
// },
// children: const [Login(), IntroB(), IntroC()],
// ),
// Padding(
// padding: const EdgeInsets.only(bottom: 25.0),
// child: Align(
// alignment: Alignment.bottomCenter,
// child: currentPage == 2
// ? InkWell(
// onTap: () {
// Navigator.pushReplacementNamed(
// context, '/login');
// },
// child: Container(
// height: 60,
// width: 60,
// decoration: BoxDecoration(
// color: const Color(0xff7e6edd),
// borderRadius: BorderRadius.circular(30)),
// child: IconButton(
// onPressed: () {
// Navigator.pushReplacementNamed(
// context, '/login');
//
// // setState(() {
// //   currentPage++;
// //   print(currentPage);
// //   _pageController.animateToPage(
// //       currentPage == 2
// //           ? currentPage
// //           : currentPage,
// //       duration:
// //           const Duration(milliseconds: 700),
// //       curve: Curves.easeIn);
// // });
// },
// icon: const Icon(
// Icons.arrow_forward_outlined,
// size: 30,
// color: Colors.white,
// )),
// ))
//     : Container(
// height: 60,
// width: 60,
// decoration: BoxDecoration(
// color: const Color(0xff7e6edd),
// borderRadius: BorderRadius.circular(30)),
// child: IconButton(
// onPressed: () {
// setState(() {
// currentPage++;
// print(currentPage);
//
// _pageController.animateToPage(
// currentPage == 2
// ? currentPage
//     : currentPage,
// duration: const Duration(
// milliseconds: 700),
// curve: Curves.easeIn);
// });
// },
// icon: const Icon(
// Icons.arrow_forward_outlined,
// size: 30,
// color: Colors.white,
// )),
// ))),
// Padding(
// padding: EdgeInsets.only(bottom: height * 0.25),
// child: Align(
// alignment: Alignment.bottomCenter,
// child: SmoothPageIndicator(
// effect:
// const SlideEffect(activeDotColor: Color(0xff7e6edd)),
// controller: _pageController,
// count: 3,
// axisDirection: Axis.horizontal,
// onDotClicked: (index) {
// setState(() {
// currentPage = index;
// _pageController.animateToPage(index,
// duration: const Duration(milliseconds: 700),
// curve: Curves.easeIn);
// });
// },
// ),
// ),
// ),
// Align(
// alignment: Alignment.topRight,
// child: Padding(
// padding: const EdgeInsets.only(right: 20.0, top: 20),
// child: InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const Login()));
// },
// child: InkWell(
// onTap: () {
// Navigator.pushNamed(context, '/login');
// },
// child: Text(
// 'Skip'.toUpperCase(),
// style: TextStyle(fontWeight: FontWeight.bold),
// ))),
// ))
// ],
// ),
//
//
//
//

import 'package:beyond_app/widgets/createAccountContent.dart';
import 'package:flutter/material.dart';

import '../widgets/createAccountContent2.dart';
import '../widgets/emailValidationContent.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/X_2.png',
                  ),
                  fit: BoxFit.fill,
                )),
            child:    Column(
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
                    flex: 7,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28))),
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        // onPageChanged: (index) {
                        //   setState(() {
                        //     _pageController.animateToPage(page, duration: duration, curve: curve)
                        //     currentPage = index;
                        //   });
                        // },
                        children: [ CreateAccountContent1(_pageController) ,CreateAccountContent2(_pageController), EmailValidationContent()],
                      ) ,
                    )


                   ,



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
