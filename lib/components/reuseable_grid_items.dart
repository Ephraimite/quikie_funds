
import 'package:flutter/material.dart';
import 'package:quikie_funds/constants.dart';

class GridItems extends StatelessWidget {

  IconData icon;
  String text;


  GridItems({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(

      margin: EdgeInsets.all(5),
      clipBehavior: Clip.antiAlias,
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: kCOLOR_PRIMARY,),
          SizedBox(height: 10),
          Text(text, style: TextStyle(
            color: Colors.black,
            fontSize: 14.0
          ),)
        ],
      ),
    );
  }
}
