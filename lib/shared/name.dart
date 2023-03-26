import 'package:flutter/material.dart';

import 'package:signs/main.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              setState(
                () => storeUserName = value,
              );
            },
            maxLength: 70,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: "Name of Ex 1",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black, width: 1.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.black, width: 2.0)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _controller1,
            onChanged: (value) {
              setState(
                () => storeUserName1 = value,
              );
            },
            maxLength: 70,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: "Name of Ex 2", // Added to make hintText more legible!
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _controller2,
            onChanged: (value) {
              setState(
                () => storeUserName2 = value,
              );
            },
            maxLength: 70,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: "Name of Ex 3",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
