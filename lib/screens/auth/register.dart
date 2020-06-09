import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/viewmodels/auth_model.dart';
import 'package:enlightenfy/screens/auth/login.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:enlightenfy/widgets/alert_dialog.dart';
import 'package:enlightenfy/widgets/inputfield.dart';
import 'package:enlightenfy/widgets/loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double deviceWidth = size.width;
    final double deviceHeight = size.height;

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
                        Image.asset('assets/images/logo.png',
                            width: 70.0, height: 70.0, color: Colors.white),
                        const SizedBox(height: 10.0),
                        const Text('Create Account',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const SizedBox(height: 40.0),
                        RegisterInputField(
                            hint: 'First name',
                            controller: firstname,
                            prefixIcon: const Icon(Icons.person_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (value.length < 2) {
                                return 'Enter a valid name';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        RegisterInputField(
                            controller: lastname,
                            hint: 'Last name',
                            prefixIcon: const Icon(Icons.person_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (value.length < 2) {
                                return 'Enter a valid name';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        RegisterInputField(
                            controller: email,
                            hint: 'Email',
                            textInputType: TextInputType.emailAddress,
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
                            controller: password,
                            obscureText: true,
                            hint: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (value.length < 6) {
                                return 'Password cannot be less than 6 characters';
                              } else {
                                return null;
                              }
                            }),
                        const SizedBox(height: 20.0),
                        RegisterInputField(
                            controller: cPassword,
                            obscureText: true,
                            hint: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.white),
                            validator: (String value) {
                              if (value.length < 6) {
                                return 'Password cannot be less than 6 characters';
                              } else {
                                return null;
                              }
                            }),
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

                                String value = await model.signup(
                                    email.text,
                                    password.text,
                                    firstname.text,
                                    lastname.text);

                                if (value == 'Success') {
                                  await showCupertinoDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CupertinoAlertDialog(
                                      title: Text('Message',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red)),
                                      content: const Text(
                                          'Account created, verify email!',
                                          style: const TextStyle(fontSize: 16)),
                                      actions: <Widget>[
                                        CupertinoDialogAction(
                                          child: const Text('OK'),
                                          onPressed: () => pushandRemove(
                                              context, const LoginScreen()),
                                        ),
                                      ],
                                    ),
                                  );
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
                        Center(
                          child: InkWell(
                            onTap: () =>
                                pushandRemove(context, const LoginScreen()),
                            child: const Text(
                              'Already have an account ?',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
