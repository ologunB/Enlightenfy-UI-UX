import 'package:enlightenfy/utils/colors.dart';
import 'package:enlightenfy/widgets/button.dart';
import 'package:flutter/material.dart';

class UserDetailCard extends StatelessWidget {
  const UserDetailCard({
      @required this.imageUrl,
      @required this.profession,
      @required this.employer,
      @required this.locationDetail,
      @required this.onAddProfileSectionTap,
      this.isSectionUp
  });

  final String imageUrl;
  final String profession;
  final String employer;
  final String locationDetail;
  final Function onAddProfileSectionTap;
  final bool isSectionUp;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80.0,
              width: double.infinity,
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(imageUrl), fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0))),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 40.0,
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        profession,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(Icons.edit_attributes), onPressed: () {})
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        employer,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  Text(locationDetail),
                  const SizedBox(height: 10.0),
                  InkWell(
                    onTap: onAddProfileSectionTap,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Add Profile Section',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.blue),
                          ),
                          const SizedBox(width: 10.0),
                          isSectionUp 
                            ? Icon(Icons.arrow_drop_up, color: Colors.blue,)
                            : Icon(Icons.arrow_drop_down, color: Colors.blue,)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.backgroundColor)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
