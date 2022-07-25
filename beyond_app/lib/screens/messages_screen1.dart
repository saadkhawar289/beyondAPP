import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xfff9f9f9),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.8,
              toolbarHeight: height * 0.10,
              leading: const Icon(
                Icons.menu_outlined,
                color: Colors.black26,
              ),
              title: const Text('Messages', style: TextStyle(color: Color(0xff00C4CC)),),
              centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/image_217.png'),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Center(
                  child: Container(
                    height: 165,
                    width: 165,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Group_13711.png',
                          ),
                          fit: BoxFit.fill,
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Text(
                    'You hav not created any message yet. Please use the button below to start creating personalized messages for your loved ones.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '');
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.65,
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
                      child: Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/addPhoneNumber');
                          },
                          child: const Text(
                            'Create Personal Message',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
