import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:signs/main.dart';
import 'package:signs/pages/quiz_screen.dart';
import 'package:signs/shared/colors.dart';

class DescribeButton extends StatelessWidget {
  const DescribeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      color: Colors.transparent,
      child: Center(
        child: RawMaterialButton(
          onPressed: () async {
            await Hive.openBox("exesData");
            print(box.get("personCount"));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizScreen(
                  personsCount: box.get("personCount"),
                ),
              ),
            );
          },
          shape: const StadiumBorder(),
          fillColor: AppColor.secondaryColor,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
            child: Text(
              "I Understand",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
