import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  EventScreen({Key key}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final String dateText = '02/08/2021';
  final String timeText = '3pm GMT + 1';
  final String descriptionText = 'The description of the event will be here';
  final String addressText =
      'Federal University of Technology Akure T.I Francis';
  final String organizersPhoneNumber = '+234 9056409882';
  final String organizersEmail = 'organizers@gmail.com';

  final List<String> _demoTags = <String>[
    'Technology',
    'Business',
    'Academics',
    'Leadership',
    'Group registration'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              singleTile(
                title: 'Description',
                subtitle: descriptionText,
              ),
              const Divider(),
              singleTile(
                title: 'Time & Date',
                subtitle: '$timeText \t\t $dateText',
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Center(
                        child: Text('Click to check event schedule')),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: AppColors.backgroundColor)),
                  ),
                ),
              ),
              const Divider(),
              singleTile(title: 'Address', subtitle: addressText),
              const Divider(),
              singleTile(
                  title: 'Organizer\'s details',
                  isThreeLine: true,
                  subtitle: '$organizersPhoneNumber \n $organizersEmail'),
              const Text(
                'Featuring',
                style: TextStyle(fontSize: 18.0),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 10.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Featuring',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 20.0),
                    Wrap(
                        direction: Axis.horizontal,
                        children: List<Widget>.generate(_demoTags.length,
                            (int index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.backgroundColor),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  _demoTags[index],
                                  style: const TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          );
                        }))
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: buttonWidget(
                      title: 'Save',
                      onPressed: () {}
                    )
                  ),
                  Expanded(
                    child: buttonWidget(
                      title: 'Share',
                      onPressed: () => showShareDialog()
                    )
                  ),
                  Expanded(
                    child: buttonWidget(
                      title: 'Register',
                      onPressed: () {}
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonWidget({String title, Function onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Center(child: Text(title)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: AppColors.backgroundColor)),
      ),
    );
  }

  Widget singleTile({String title, String subtitle, bool isThreeLine = false}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
      subtitle: Text(subtitle),
      isThreeLine: isThreeLine,
    );
  }

  void showShareDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            height: 250.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Contacts'),
                  onTap: () {
                    pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Groups'),
                  onTap: () {
                    pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Timeline'),
                  onTap: () {
                    pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Copy'),
                  onTap: () {
                    pop(context);
                  },
                )
              ],
            ),
          ));
        });
  }
}
