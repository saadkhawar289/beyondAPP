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
          appBar: AppBar(
            leading: Icon(
              Icons.menu_outlined
            ),
            title: Text('Messages'),
            centerTitle: true,
            actions: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                height: 136,
                width: 136,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/Group_61.png',
                      ),
                      fit: BoxFit.fill,
                    )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
