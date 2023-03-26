// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:signs/pages/disclaimer.dart';
import 'package:signs/shared/colors.dart';

class DisclaimerButton extends StatelessWidget {
  const DisclaimerButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      color: Colors.transparent,
      child: Center(
        child: RawMaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Disclaimer(),
              ),
            );
          },
          shape: StadiumBorder(),
          fillColor: AppColor.secondaryColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0),
            child: Text(
              "I Understand",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
