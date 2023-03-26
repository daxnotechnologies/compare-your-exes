import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final void Function()? addData;
  const StartButton({
    Key? key,
    this.addData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RawMaterialButton(
        onPressed: addData,
        shape: const StadiumBorder(),
        fillColor: const Color(0xff1062C2),
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 44.0,
          ),
          child: Text(
            "Start",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
