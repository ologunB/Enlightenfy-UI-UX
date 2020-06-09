import 'dart:async';
import 'dart:convert';

import 'package:enlightenfy/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  var client = http.Client();
  Map<String, Object> map = Map();

  void messageMaker(int code, String message) {
    map.update('statusCode', (a) => code, ifAbsent: () => code);
    map.update('message', (a) => message, ifAbsent: () => message);
  }

  void addToDB(String email, String token) {
    final Box<String> userDetailsBox = Hive.box(userDetails);
    userDetailsBox.put('email', email);
    userDetailsBox.put('token', token);
    userDetailsBox.put('type', 'User');
  }

  Future<Map> loginUser(String email, String password) async {
    final String url = '$endpoint/auth/login';

    await client.post(url, body: {'email': email, 'password': password}).then(
        (http.Response response) {
      String body = response.body;
      int code = jsonDecode(body)['statusCode'] ?? 200;
      String message = jsonDecode(body)['message'];

      if (code == 200) {
        String token = jsonDecode(body)['token'];
        addToDB(email, token);
      }
      print(body);
      messageMaker(code, message);
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      messageMaker(408, 'Connection timed out!');
    });
    return map;
  }

  Future<Map> signupUser(
      String email, String password, String fname, String lname) async {
    final String url = '$endpoint/auth/signup';

    await client.post(url, body: {
      'email': email,
      'password': password,
      'confirmpassword': password,
      'firstname': fname,
      'lastname': lname
    }).then((http.Response response) {
      String body = response.body;
      int code = jsonDecode(body)['statusCode'];
      String message = jsonDecode(body)['message'];

      print(body);
      print(code);
      messageMaker(code, message);
    }).catchError((e) {
      print(e);
      messageMaker(500, 'An error has occured!');
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      messageMaker(408, 'Connection timed out!');
    });
    return map;
  }
}
