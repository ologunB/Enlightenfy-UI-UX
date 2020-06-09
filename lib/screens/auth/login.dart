import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/viewmodels/auth_model.dart';
import 'package:enlightenfy/screens/auth/register.dart';
import 'package:enlightenfy/screens/base_view.dart';
import 'package:enlightenfy/screens/home/home.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:enlightenfy/widgets/alert_dialog.dart';
import 'package:enlightenfy/widgets/inputfield.dart';
import 'package:enlightenfy/widgets/loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthModel>(
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.backgroundColor,
              body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 15.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 70.0,
                          height: 70.0,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10.0),
                        const Text('Welcome back',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 40.0),
                        RegisterInputField(
                            textInputType: TextInputType.emailAddress,
                            hint: 'Email',
                            controller: email,
                            prefixIcon: const Icon(Icons.mail_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (!regex.hasMatch(value)) {
                                return 'Enter a valid email';
                              } else if (value.isEmpty) {
                                return 'Field cannot be empty';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        RegisterInputField(
                            obscureText: true,
                            hint: 'Password',
                            controller: password,
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'You must enter a password';
                              } else if (value.length < 4) {
                                return 'Password cannot be less than 4 characters';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () => push(context, const LoginScreen()),
                            child: const Text(
                              'Forgot Password ?',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Center(
                          child: LoadingButton(
                              label: 'SIGN IN',
                              loading:
                                  model.state == ViewState.Busy ? true : false,
                              onPressed: () async {
                                _formKey.currentState.save();
                                _formKey.currentState.validate();

                                if (!_formKey.currentState.validate()) {
                                  return;
                                }

                                String value = await model.login(
                                    email.text, password.text);

                                if (value == 'Success') {
                                  pushandRemove(context, const HomeScreen());
                                } else {
                                  await showAlertDialog(
                                      onCancel: () {
                                        Navigator.pop(context);
                                      },
                                      onOK: () {
                                        Navigator.pop(context);
                                      },
                                      context: context,
                                      title: 'Message',
                                      content: value,
                                      defaultActionText: 'OK');
                                }
                              }),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              height: 1.0,
                              color: Colors.white,
                            ),
                            const Text('  OR  ',
                                style: TextStyle(color: Colors.white)),
                            Container(
                              width: 100.0,
                              height: 1.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Center(
                          child: InkWell(
                            onTap: () => push(context, const RegisterScreen()),
                            child: const Text(
                              'Not a member? Click to register',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
