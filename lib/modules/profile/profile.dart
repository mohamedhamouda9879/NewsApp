import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(12.0),
              width: mq.width * .99,
              height: mq.height * .25,
              child: Image.asset('assets/images/logo.png')),
          Container(
              width: mq.width * 0.90,
              height: mq.height * .05,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Name',
                  style: TextStyle(fontSize: 18.0),
                ),
              )),
          Container(
              width: mq.width * 0.90,
              height: mq.height * .05,
              margin: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'email@gmail.com',
                  style: TextStyle(fontSize: 14.0),
                ),
              )),
        ],
      )),
    );
  }
}
