import 'dart:async';

import 'package:enlightenfy/screens/onboarding/tab.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() { 
    Timer(const Duration(seconds: 3), () {
      pushReplacement(context, Tabs());
    });
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: 80, width: 80.0,),
              const SizedBox(height: 20.0),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  
                  children: <TextSpan>[
                    TextSpan(
                      text: 'From\n\n',
                      style: TextStyle(fontSize: 18.0, color: Colors.black)
                    ),
                    TextSpan(
                      text: 'PLENTHEON',
                      style: TextStyle(fontSize: 24.0, color: Colors.black)
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}