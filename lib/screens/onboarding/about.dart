import 'package:enlightenfy/utils/colors.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
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
                  const Icon(Icons.info_outline, size: 100.0, color: Colors.white,),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'About us',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(
                    height: 15.0
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Enlightenfy is a cross platform mobile service owned by Plentheon. It opens users to create, share, manage, access life changing events, meetings, jobs and scholarships, resourceful human networks and other personalized features.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18, 
                        color: Colors.white, 
                      ),
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