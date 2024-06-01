import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wolfcareapp/mainScreen/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
    Timer(const Duration(seconds: 5), () async
    {
      //send user to home screen
      Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
    });
  }

  @override
  void initState() {

    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xffB81736),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      
              Image.asset("images/logo64.png"),
      
              const SizedBox(height: 10,),
      
              const Text(
                "Wolf Care",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
