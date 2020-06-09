import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/services/authentication_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class AuthModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<String> login(String email, String password) async {
    setState(ViewState.Busy);
    String message = '';

    Map<String, Object> map =
        await _authenticationService.loginUser(email, password);

    if (map['statusCode'] == 200) {
      message = 'Success';
    } else {
      message = map['message'];
    }
    setState(ViewState.Idle);
    return message;
  }

  Future<String> signup(
      String email, String password, String fname, String lname) async {
    setState(ViewState.Busy);
    String message = '';

    Map map =
        await _authenticationService.signupUser(email, password, fname, lname);

    if (map['statusCode'] == 201) {
      message = 'Success';
    } else {
      message = map['message'];
    }
    setState(ViewState.Idle);
    return message;
  }
}
