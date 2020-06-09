import 'package:flutter/material.dart';


class SingleGroup extends StatelessWidget {
  const SingleGroup({
    @required this.groupName,
    this.onTap
  });

  final String groupName;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.group),
        title: Text(groupName),
        trailing: Icon(Icons.person),
        onTap: onTap,
      ),
    );
  }
}