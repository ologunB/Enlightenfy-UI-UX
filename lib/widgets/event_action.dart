import 'package:flutter/material.dart';


class EventAction extends StatelessWidget {
  const EventAction({
    @required this.icon,
    @required this.label,
    @required this.onTap
  });

  final String icon;
  final String label;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200.0,
          width: 150.0,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(icon, height: 60.0, width: 60.0),
              const SizedBox(height: 20.0),
              Text(label, style: const TextStyle(fontSize: 20.0),)
            ],
          ),
        ),
      ),
    );
  }
}