import 'package:enlightenfy/screens/tabpages/events.dart';
import 'package:enlightenfy/screens/tabpages/groups.dart';
import 'package:enlightenfy/screens/tabpages/home.dart';
import 'package:enlightenfy/screens/tabpages/jobs.dart';
import 'package:enlightenfy/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  PageController _controller;

  final List<Widget> _pages = const <Widget>[
    HomePageScreen(),
    EventsPageScreen(),
    JobsPageScreen(),
    GroupsPageScreen()
  ];

  @override
  void initState() {
    _controller = PageController(keepPage: true, initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: _pages,
          controller: _controller,
          onPageChanged: onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.blue,
            selectedItemColor: AppColors.backgroundColor,
            selectedLabelStyle: TextStyle(color: AppColors.backgroundColor),
            unselectedLabelStyle: const TextStyle(color: Colors.blue),
            onTap: onPageChanged,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: const Text('Home')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.event), title: const Text('Event')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt), title: const Text('Jobs')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group), title: const Text('Groups')),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), title: Text('More')),
            ]));
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    _controller.jumpToPage(index);
  }

  Widget singleAppBarItem(Icon icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[icon, const SizedBox(height: 3.0), Text(label)],
      ),
    );
  }
}
