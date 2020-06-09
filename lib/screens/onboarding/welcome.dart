import 'package:enlightenfy/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double deviceWidth = size.width;
    final double deviceHeight = size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/logo.png', height: 100.0, width: 100.0, color: Colors.white,),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 15.0
                  ),
                  
                  const Text(
                    'Enligtenfy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, 
                      color: Colors.white, 
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'dont be uninformed',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18, 
                      color: Colors.white, 
                    ),
                  ),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}
