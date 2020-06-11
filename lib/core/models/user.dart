import 'package:enlightenfy/core/models/education.dart';
import 'package:enlightenfy/core/models/experience.dart';

class User {
  String firstname;
  String lastname;
  String password;
  List educations;
  List experiences;

  User(
      {this.firstname,
      this.lastname,
      this.password,
      this.educations,
      this.experiences});

  User.fromJson(Map<String, Object> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    password = json['password'];
    educations = json['education'];
    experiences = json['experience'];
  }

  Map<String, Object> toJson() {
    final Map<String, Object> data = <String, Object>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['password'] = password;
    data['education'] = educations;
    data['experience'] = experiences;
    return data;
  }
}
