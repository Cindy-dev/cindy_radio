import 'package:cindy_radio/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            alignment: Alignment.bottomRight,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/image/live_radio.png'),
                    fit: BoxFit.fill))),
        Positioned(
          bottom: 0,
          right: 10,
          child: GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => HomeScreen())),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(
                  9, 0, 15, MediaQuery.of(context).size.height / 35),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xfffd8918),
                    Color(0xfffeb322),
                    Color(0xfffd8b19)
                  ]),
                  borderRadius: BorderRadius.circular(8)),
              height: 50,
              width: MediaQuery.of(context).size.width * .35,
              child: Text(
                'Sign up',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
