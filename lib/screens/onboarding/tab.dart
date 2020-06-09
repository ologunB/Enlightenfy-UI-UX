import 'package:enlightenfy/screens/auth/login.dart';
import 'package:enlightenfy/screens/onboarding/about.dart';
import 'package:enlightenfy/screens/onboarding/welcome.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:enlightenfy/widgets/button.dart';
import 'package:enlightenfy/widgets/indicator.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final List<Widget> _pages = <Widget>[
    WelcomeScreen(), 
    AboutScreen()
  ];

  int index = 0;

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  Widget buildPageView(PageController pageController) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 500.0,
            child: Container(
              color: Colors.white,
              child: PageView(
                children: _pages,
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int index) {
                  pageChanged(index);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: <Widget>[
                Indicator(
                  controller: pageController,
                  itemCount: 2,
                ),
                const SizedBox(height: 40.0),
                Button(
                  label: 'Next',
                  width: 200,
                  onPressed: () {
                    push(context, const LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: buildPageView(_pageController),
    );
  }
}
