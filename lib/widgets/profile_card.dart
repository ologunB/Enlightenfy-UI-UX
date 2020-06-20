import 'package:enlightenfy/core/models/experience.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {@required this.title, @required this.itemList, this.onEditPressed});

  final String title;
  final List itemList;
  final Function onEditPressed;

  Widget getList() {
    Widget widget;
    if (title == 'Experience') {
      print(itemList);
      List<Experience> exps = List();
      for (var data in itemList) {
        exps.add(Experience.fromJson(data));
      }
      widget = exps.isEmpty
          ? Text('No $title yet, Add $title')
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(exps[index].title),
                    subtitle: Text(exps[index].description),
                    isThreeLine: true);
              },
              itemCount: itemList.length,
              shrinkWrap: true);
    } else if (title == 'Education') {
      widget = itemList.isEmpty
          ? Text('No $title yet, Add $title')
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                    title: itemList[index].school,
                    subtitle: itemList[index].degree,
                    isThreeLine: true);
              },
              itemCount: itemList.length,
              shrinkWrap: true);
    } else if (title == 'Achievements') {
      widget = Text('No $title yet, Add $title');
    } else if (title == 'About') {
      widget = Text('No $title yet, Add $title');
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit_attributes,
                          color: Colors.blue,
                        ),
                        onPressed: onEditPressed)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                getList()
              ],
            )));
  }
}
