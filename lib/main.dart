import 'package:enlightenfy/screens/auth/login.dart';
import 'package:enlightenfy/screens/home/home.dart';
import 'package:enlightenfy/screens/onboarding/splash.dart';
import 'package:enlightenfy/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'locator.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(userDetails);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'Product',
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  String uid, _type;
  Box<String> userDetailsBox;

  @override
  void initState() {
    super.initState();
    userDetailsBox = Hive.box(userDetails);
  }

  @override
  Widget build(BuildContext context) {
    uid = userDetailsBox.get('uid');
    _type = userDetailsBox.get('type');
    if (_type == 'User') {
      return const HomeScreen();
    } else if (_type == 'Login') {
      return LoginScreen();
    } else {
      return SplashScreen();
    }
  }
}
