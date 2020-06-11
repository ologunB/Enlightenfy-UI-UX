import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/models/experience.dart';
import 'package:enlightenfy/core/models/user.dart';
import 'package:enlightenfy/core/services/user_details_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class UserDetailsModel extends BaseModel {
  final UserDetailService _userDetailService = locator<UserDetailService>();

  User get mUser => _userDetailService.mUser;
  User user;
  String message;

  Future<User> getDetails() async {
    setState(ViewState.Busy);

    Map<String, Object> map = await _userDetailService.getUserProfile();

    if (map['statusCode'] == 200) {
      user = User.fromJson(map);
    } else {
      user = map['message'];
    }
    setState(ViewState.Idle);
    return user;
  }

  Future<String> updateExpe(String title, String description,
      String company_name, String from, String to) async {
    setState(ViewState.Busy);

    Map<String, Object> map = await _userDetailService.updateExperience(
        title, description, company_name, from, to);

    if (map['statusCode'] == 201) {
      message = map['message'];
      mUser.experiences.add({
        'title': title,
        'company_name': company_name,
        'description': description,
        'from': from,
        'to': to
      });
    } else {
      user = map['message'];
    }
    setState(ViewState.Idle);
    return message;
  }
}
