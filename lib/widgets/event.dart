import 'package:flutter/material.dart';


class SingleEvent extends StatelessWidget {
  const SingleEvent({
    Key key,
    @required this.eventTitle,
    @required this.eventDescription,
    @required this.imageUrl,
    @required this.currentLikes,
    @required this.currentAttendees,
    @required this.onPressed
  }) : super(key: key);

  final String eventTitle;
  final String eventDescription;
  final String imageUrl;
  final String currentLikes;
  final String currentAttendees;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(eventTitle, style: TextStyle(fontSize: 20.0, color: Colors.black)),
                subtitle: Text(eventDescription),
              ),
              Image.network(imageUrl, width: double.infinity,),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    currentLikes,
                  ),
                  Text(
                    currentAttendees
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 5.0),
                        Text('Like')
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.share, color: Colors.blue),
                        SizedBox(width: 5.0),
                        Text('Share')
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}