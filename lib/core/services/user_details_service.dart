import 'dart:async';
import 'dart:convert';

import 'package:enlightenfy/core/models/user.dart';
import 'package:enlightenfy/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserDetailService {
  var client = http.Client();
  Map<String, Object> map = Map();

  void messageMaker(int code, Map data) {
    map.update('statusCode', (a) => code, ifAbsent: () => code);
    map.update('data', (a) => data, ifAbsent: () => data);
  }

  void messageMaker2(int code, String data) {
    map.update('statusCode', (a) => code, ifAbsent: () => code);
    map.update('data', (a) => data, ifAbsent: () => data);
  }

  User user;

  User get mUser => user;

  Future<Map> getUserProfile() async {
    final String url = '$endpoint/auth/details';
    var headers = {'Authorization': 'Bearer $userToken'};
    await client.get(url, headers: headers).then((http.Response response) {
      String body = response.body;
      int code = response.statusCode;

      Map data = jsonDecode(body)['data'];
      print(data);
      user = User.fromJson(data);

      messageMaker(code, data);
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      messageMaker(408, {'message': 'Connection timed out!'});
    }).catchError((e) {
      messageMaker(408, {'message': 'Error!'});
    });
    return map;
  }

  Future<Map> updateExperience(String title, String description,
      String company_name, String from, String to) async {
    final String url = '$endpoint/auth/update/experience';
    var headers = {'Authorization': 'Bearer $userToken'};

    await client
        .patch(url,
            body: {
              'title': title,
              'description': description,
              'company_name': company_name,
              'from': from,
              'to': to
            },
            headers: headers)
        .then((http.Response response) {
      String body = response.body;
      int code = jsonDecode(body)['statusCode'];
      String message = jsonDecode(body)['message'];

      print(body);
      messageMaker2(code, message);
    }).catchError((e) {
      print(e);
      messageMaker2(500, 'An error has occured!');
    }).timeout(const Duration(seconds: 30), onTimeout: () {
      messageMaker2(408, 'Connection timed out!');
    });

    return map;
  }
}
