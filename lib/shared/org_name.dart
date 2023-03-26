import 'package:flutter/material.dart';

class OrgName extends StatelessWidget {
  const OrgName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          heightFactor: 8.0,
          child: Text(
            "Compare my Exes",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        // Add your image with a clear background widget here
        Positioned(
          top: 0,
          left: 0,
          bottom: 90,
          right: 0,
          child: Image.asset(
            'assets/images/logo_transparent.png',
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
