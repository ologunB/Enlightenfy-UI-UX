import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/services/user_details_service.dart';
import 'package:enlightenfy/core/viewmodels/user_details_model.dart';
import 'package:enlightenfy/screens/base_view.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/button.dart';
import 'package:enlightenfy/widgets/loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert_dialog.dart';

void showJoinDialog(
    BuildContext context, TextEditingController controller, String title,
    {String buttonLabel, int maxLines}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10.0),
            height: 200.0,
            child: Column(
              children: <Widget>[
                Text(title),
                const Divider(),
                TextFormField(
                  controller: controller,
                  maxLines: maxLines ?? 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                const SizedBox(height: 10.0),
                Button(
                  label: buttonLabel ?? 'Continue',
                  onPressed: () {},
                  color: AppColors.backgroundColor,
                )
              ],
            ),
          ),
        );
      });
}

void showExperienceDialog(
    {BuildContext context,
    TextEditingController titleController,
    TextEditingController descriptionController,
    TextEditingController companyController,
    TextEditingController fromController,
    TextEditingController toController,
    int numOfExperiences}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BaseView<UserDetailsModel>(
            onModelReady: (model) {},
            builder: (context, model, child) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const Text('Update your Experience'),
                          const Divider(),
                          Text(
                              'You currently have ${model.mUser.experiences.length} experiences'),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                                labelText: 'Title (Role)',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: companyController,
                            decoration: InputDecoration(
                                labelText: 'Company name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime from = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(1990),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime.now());

                                    fromController.text = from.toString();
                                  },
                                  controller: fromController,
                                  decoration: InputDecoration(
                                      labelText: 'From',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime to = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime(1990),
                                        firstDate: DateTime(1990),
                                        lastDate: DateTime.now());

                                    toController.text = to.toString();
                                  },
                                  controller: toController,
                                  decoration: InputDecoration(
                                      labelText: 'To (expected)',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          LoadingButton(
                            loading:
                                model.state == ViewState.Busy ? true : false,
                            label: 'Update',
                            onPressed: () async {
                              String value = await model.updateExpe(
                                  titleController.text,
                                  descriptionController.text,
                                  companyController.text,
                                  fromController.text,
                                  toController.text);

                              if (value == 'updated') {
                                Navigator.pop(context);

                                await showCupertinoDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    title: Text('Message',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.red)),
                                    content: const Text('Experience Updated!',
                                        style:   TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                    actions: <Widget>[
                                      CupertinoDialogAction(
                                          child: const Text('OK'),
                                          onPressed: () =>
                                              Navigator.pop(  context)),
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
                            },
                            color: AppColors.backgroundColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      });
}

void showEducationDialog({
  BuildContext context,
  TextEditingController schoolController,
  TextEditingController degreeController,
  TextEditingController studyController,
  TextEditingController descriptionController,
  TextEditingController locationController,
  TextEditingController fromController,
  TextEditingController toController,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return BaseView<UserDetailsModel>(
            onModelReady: (model) {},
            builder: (context, model, child) => Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          const Text('Update your Education'),
                          const Divider(),
                          TextFormField(
                            controller: schoolController,
                            decoration: InputDecoration(
                                labelText: 'School name',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: degreeController,
                            decoration: InputDecoration(
                                labelText: 'Degree',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: studyController,
                            decoration: InputDecoration(
                                labelText: 'Field of study',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: locationController,
                            decoration: InputDecoration(
                                labelText: 'Location',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: fromController,
                                  decoration: InputDecoration(
                                      labelText: 'From',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                flex: 1,
                                child: TextFormField(
                                  controller: toController,
                                  decoration: InputDecoration(
                                      labelText: 'To (expected)',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Button(
                            label: 'Update',
                            onPressed: () {},
                            color: AppColors.backgroundColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
      });
}
