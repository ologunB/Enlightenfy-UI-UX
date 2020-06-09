import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pop(BuildContext context) {
  Navigator.pop(context);
}

void push(BuildContext context, Widget page) {
  Navigator.push(context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
    return page;
  }));
}

void pushReplacement(BuildContext context, Widget page) {
  Navigator.pushReplacement(context,
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
    return page;
  }));
}

void pushandRemove(BuildContext context, Widget page) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<dynamic>(builder: (context) => page),
      (Route<dynamic> route) => false);
}
