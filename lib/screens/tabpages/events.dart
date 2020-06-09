import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/button.dart';
import 'package:enlightenfy/widgets/event_action.dart';
import 'package:flutter/material.dart';


class EventsPageScreen extends StatefulWidget {
  const EventsPageScreen({Key key}) : super(key: key);

  @override
  _EventsPageScreenState createState() => _EventsPageScreenState();
}

class _EventsPageScreenState extends State<EventsPageScreen> {

  final TextEditingController _controller = TextEditingController();

  final List<String> _actionLabel = <String>[
    'Create',
    'Manage',
    'Register',
    'Attend',
    'Past',
    'Registered',
    'Saved',
    'Search'
  ];

  final List<String> _icons = <String>[
   'assets/images/create.png',
   'assets/images/manage.png',
   'assets/images/register.png',
   'assets/images/attend.png',
   'assets/images/past.png',
   'assets/images/register.png',
   'assets/images/saved.png',
   'assets/images/search.png'

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
                Text('Events'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20.0)),
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
                    children: List<Widget>.generate(_actionLabel.length, (int index) {
                      return EventAction(
                        icon: _icons[index], 
                        label: _actionLabel[index],
                        onTap: () => showJoinDialog()
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

  void showJoinDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(10.0),
            height: 200.0,
            child: Column(
              children: <Widget>[
                const Text(
                  'Paste Group link or name here '
                ),
                const Divider(),
                TextFormField(
                  controller: _controller, 
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                ),
                const SizedBox(height: 10.0),
                Button(
                  label: 'Continue',
                  onPressed: () {},
                  color: AppColors.backgroundColor,
                )
              ],
            ),
          ),
        );
      }
    );
  }
}