import 'package:enlightenfy/screens/event/events.dart';
import 'package:enlightenfy/screens/home/profile.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/utils/navigation.dart';
import 'package:enlightenfy/widgets/event.dart';
import 'package:enlightenfy/widgets/search_field.dart';
import 'package:flutter/material.dart';

import '../../widgets/toast.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController _searchController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 30.0,
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          'Freemium',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text('John Doe Mike')
                      ],
                    )
                  ],
                ),
                const Divider(),
                const Text('View my profile',
                    style: TextStyle(
                        fontSize: 18.0, color: AppColors.backgroundColor)),
                const Divider(),
                ListTile(
                  title: const Text('Account'),
                  onTap: () {
                    push(context, const ProfileScreen());
                   },
                ),
                const ListTile(
                  title: Text('Settings and Privacy'),
                ),
                const ListTile(
                  title: Text('Help'),
                ),
                const Divider(),
                const Text('Recent Activities',
                    style: TextStyle(
                        fontSize: 18.0, color: AppColors.backgroundColor)),
                const Divider(),
                const SizedBox(height: 30.0),
                const Divider(),
                const Text('Manage',
                    style: TextStyle(
                        fontSize: 18.0, color: AppColors.backgroundColor)),
                const Divider(),
                const ListTile(
                  title: Text('Event Analysis'),
                ),
                const ListTile(
                  title: Text('Meeting Analysis'),
                ),
                const Divider(),
                const ListTile(
                  title: Text('Sign out'),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Container(
            height: 40.0,
            child: SearchInputField(
                controller: _searchController,
                hintText: 'Search events or meets here')),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.mail),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SingleEvent(
                eventTitle: 'Google IO 2020',
                eventDescription:
                    'A worldwide google meetup for all google developers',
                imageUrl:
                    'https://www.androidpolice.com/wp-content/uploads/2018/05/io-social-banner.png',
                currentLikes: '23 Likes',
                currentAttendees: '232 Attending',
                onPressed: () => push(context, EventScreen()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
