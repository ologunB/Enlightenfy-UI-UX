import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/event_action.dart';
import 'package:flutter/material.dart';



class JobsPageScreen extends StatefulWidget {
  const JobsPageScreen({Key key}) : super(key: key);

  @override
  _JobsPageScreenState createState() => _JobsPageScreenState();
}

class _JobsPageScreenState extends State<JobsPageScreen> {

  final List<String> _meetingActionLabels  = <String>[
    'Schedule',
    'Manage',
    'Approved',
    'Pending',
    'Past',
    'Saved'
  ];

  final List<String> _meetingActionIcons = <String>[
   'assets/images/create.png',
   'assets/images/manage.png',
   'assets/images/register.png',
   'assets/images/attend.png',
   'assets/images/past.png',
   'assets/images/saved.png',

  ];

  @override
  Widget build(BuildContext context) {
   final Size size = MediaQuery.of(context).size;
    final double deviceHeight = size.height;
    final double deviceWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceHeight / 3,
            color: AppColors.backgroundColor,
          ),

          Positioned(
            top: 40.0,
            left: 20.0,
            child: Row(
              children: <Widget>[
                Text('Meetings'.toUpperCase(), 
                  style: TextStyle(color: Colors.white, fontSize: 20.0)
                ),
              ],
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120.0,
                left: 20.0,
                right: 20.0
              ),
              child: SingleChildScrollView(
                child: Container(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: List<Widget>.generate(_meetingActionLabels.length, (int index) {
                      return EventAction(
                        icon: _meetingActionIcons[index], 
                        label: _meetingActionLabels[index],
                        onTap: () {}
                      );
                    })
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}