import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Text(
            "Discover",
            style: TextStyle(
                fontFamily: 'Noto',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 26),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.search, color: Colors.black),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade100)),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Icons.notifications_none, color: Colors.black),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade100)),
          ),
        ],
      ),
    );
  }
}
