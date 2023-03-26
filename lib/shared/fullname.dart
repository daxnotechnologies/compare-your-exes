import 'package:flutter/material.dart';

class FullName extends StatelessWidget {
  const FullName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      heightFactor: 2.0,
      child: Text(
        "Compare my Exes",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
