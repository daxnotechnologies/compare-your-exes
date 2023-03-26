import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  const Name({Key? key}) : super(key: key);
  static const String _name = "This Person";
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nameController1 = TextEditingController();
  final TextEditingController _nameController2 = TextEditingController();

  static String _name = "This Person";
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameController1.dispose();
    _nameController2.dispose();

    super.dispose();
  }

  String get() {
    return _name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            width: 200.0,
            height: 100.0,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: TextField(
              onChanged: (value) {
                _NameState().setState(() {
                  _name = value;
                });
              },
              controller: _nameController,
              maxLength: 70,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Name of Ex 1",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0)),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            width: 200.0,
            height: 100.0,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: TextField(
              onChanged: (value) {
                _NameState().setState(() {
                  _name = value;
                });
              },
              controller: _nameController,
              maxLength: 70,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Name of Ex 1",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0)),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            width: 200.0,
            height: 100.0,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: TextField(
              onChanged: (value) {
                _NameState().setState(() {
                  _name = value;
                });
              },
              controller: _nameController,
              maxLength: 70,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Name of Ex 3",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.green, width: 1.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
