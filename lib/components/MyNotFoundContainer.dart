import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class MyNotFoundContainer extends StatelessWidget {
  String text;
  MyNotFoundContainer({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.solidSadCry,
              size: 100,
              color: Colors.yellowAccent[400],
            ),
            SizedBox(
              height: 20,
            ),
            Text(text,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
          ],
        ),
      ),
    );
  }
}