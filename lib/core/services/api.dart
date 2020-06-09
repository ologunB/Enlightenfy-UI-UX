import 'dart:convert';

import 'package:enlightenfy/core/models/user.dart';
import 'package:enlightenfy/utils/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  var client = http.Client();

  static final Api _instance = Api.internal();
  Api.internal();
  factory Api() => _instance;

  final JsonDecoder _decoder = JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<User> getUserProfile(int userId) async {
    var response = await client.get('$endpoint/users/$userId');

    return User.fromJson(json.decode(response.body));
  }
}
/*
  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await client.get('$endpoint/posts?userId=$userId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }  */
