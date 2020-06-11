import 'package:enlightenfy/core/enums/viewstate.dart';
import 'package:enlightenfy/core/viewmodels/auth_model.dart';
import 'package:enlightenfy/core/viewmodels/user_details_model.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/dialog.dart';
import 'package:enlightenfy/widgets/profile_card.dart';
import 'package:enlightenfy/widgets/search_field.dart';
import 'package:enlightenfy/widgets/user_detail_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _studyController = TextEditingController();
  final TextEditingController _descriptionEducationController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _fromEducationController =
      TextEditingController();
  final TextEditingController _toEducationController = TextEditingController();

  bool isSectionUp = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<UserDetailsModel>(
        onModelReady: (UserDetailsModel model) => model.getDetails(),
        builder: (context, model, child) => Scaffold(
              appBar: model.state == ViewState.Busy
                  ? AppBar(
                      title: const Text('-- ---'),
                      backgroundColor: AppColors.backgroundColor,
                    )
                  : AppBar(
                      title: Text(
                          model.mUser.firstname + " " + model.mUser.lastname),
                      backgroundColor: AppColors.backgroundColor,
                    ),
              body: model.state == ViewState.Busy
                  ? const Center(
                      child: const CupertinoActivityIndicator(radius: 15))
                  : Container(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            UserDetailCard(
                              imageUrl:
                                  'https://www.androidpolice.com/wp-content/uploads/2018/05/io-social-banner.png',
                              employer: 'Abc Technologies',
                              profession: 'Software Engineer',
                              locationDetail: 'Lagos, Nigeria',
                              isSectionUp: isSectionUp,
                              onAddProfileSectionTap: () {
                                if (isSectionUp == true) {
                                  setState(() {
                                    isSectionUp = false;
                                  });
                                } else {
                                  setState(() {
                                    isSectionUp = true;
                                  });
                                }
                              },
                            ),
                            const SizedBox(height: 10.0),
                            Visibility(
                              visible: isSectionUp,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: <Widget>[
                                    ExpansionTile(
                                      title: const Text(
                                        'Introduction',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:
                                              Text('Introduction details here'),
                                        )
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: const Text(
                                        'About',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('About details here'),
                                        )
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: const Text(
                                        'Work Experience',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:
                                              Text('Experience details here'),
                                        )
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: const Text(
                                        'Education',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Education details here'),
                                        )
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: const Text(
                                        'Achievements',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:
                                              Text('Achievements details here'),
                                        )
                                      ],
                                    ),
                                    ExpansionTile(
                                      title: const Text(
                                        'Additional information',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onExpansionChanged: (bool isChanged) {},
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child:
                                              Text('information details here'),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ProfileCard(
                              title: 'About',
                              itemList: [],
                              onEditPressed: () {
                                showJoinDialog(context, _aboutController,
                                    'Update your about',
                                    buttonLabel: 'Update', maxLines: 2);
                              },
                            ),
                            const SizedBox(height: 10.0),
                            ProfileCard(
                              title: 'Experience',
                              itemList: model.mUser.experiences,
                              onEditPressed: () {
                                showExperienceDialog(
                                    context: context,
                                    titleController: _titleController,
                                    descriptionController:
                                        _descriptionController,
                                    companyController: _companyController,
                                    toController: _toController,
                                    fromController: _fromController,
                                    numOfExperiences: 4);
                              },
                            ),
                            const SizedBox(height: 10.0),
                            ProfileCard(
                              title: 'Education',
                              itemList: [],
                              onEditPressed: () {
                                showEducationDialog(
                                  context: context,
                                  schoolController: _schoolController,
                                  degreeController: _degreeController,
                                  studyController: _studyController,
                                  descriptionController:
                                      _descriptionEducationController,
                                  locationController: _locationController,
                                  toController: _toEducationController,
                                  fromController: _fromEducationController,
                                );
                              },
                            ),
                            const SizedBox(height: 10.0),
                            ProfileCard(
                              title: 'Achievements',
                              itemList: [],
                              onEditPressed: () {},
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ),
            ));
  }
}
