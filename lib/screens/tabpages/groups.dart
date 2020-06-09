import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/button.dart';
import 'package:enlightenfy/widgets/group.dart';
import 'package:enlightenfy/widgets/search_field.dart';
import 'package:flutter/material.dart';


class GroupsPageScreen extends StatefulWidget {
  const GroupsPageScreen({Key key}) : super(key: key);

  @override
  _GroupsPageScreenState createState() => _GroupsPageScreenState();
}

class _GroupsPageScreenState extends State<GroupsPageScreen> {
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Groups'),
        backgroundColor: AppColors.backgroundColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {},
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'List of groups you\'re a member in'
                  ),
                  Column(
                    children: List<Widget>.generate(10, (int index) {
                      return SingleGroup(
                        groupName: 'Group $index',
                        onTap: () => showOptionsDialog(),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            left: 10.0,
            child: Button(
              width: 200,
              color: AppColors.backgroundColor,
              label: 'Join group',
              onPressed: () => showJoinDialog()

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

  void showOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            height: 150,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: const Text('Open'),
                  onTap: () {},
                ),

                ListTile(
                  title: const Text('Leave group'),
                  onTap: () {},
                )
              ],
            ),
          ),
        );
      }
    );
  }
}