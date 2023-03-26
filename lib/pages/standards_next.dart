// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:signs/main.dart';
import 'package:signs/pages/description.dart';
import 'package:signs/pages/main_menu.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/org_name.dart';
import 'package:signs/pages/standards.dart';

class StandardNextScreen extends StatefulWidget {
  const StandardNextScreen({super.key});

  @override
  State<StandardNextScreen> createState() => _StandardNextScreenState();
}

class _StandardNextScreenState extends State<StandardNextScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainMenu(),
            ));
      } else if (index == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Describe(),
            ));
      } else if (index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Standards(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BannerAds(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              appName,
              style: TextStyle(
                  color: Color.fromRGBO(47, 141, 255, 0.9),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0),
            ),
            centerTitle: true,
            floating: true,
          ),
          SliverPadding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              sliver: SliverToBoxAdapter(
                  child: RichText(
                      text: TextSpan(
                          text:
                              'We have discussed and agreed upon financial expectations.',
                          style: TextStyle(
                              height: 1,
                              fontSize: 14,
                              wordSpacing: 1.0,
                              letterSpacing: 1.0))))),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon our stance on having friends of the opposite gender.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon religious affiliation and belief structure.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon the authority of in-laws in our relationship.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text: 'We have discussed and agreed upon drug use.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon how much debt we will comfortably maintain.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon how to handle disagreements.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon potentially relocating to pursue employment opportunities.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon potentially downsizing lifestyle based on economic necessity. ',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon discussing spousal information with family and or friends.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon Whether to legalize our relationship with the state or not.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon how we will approach mental health concerns.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon how we will handle potential job loss or employment relocations.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon our deepest values.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'We have discussed and agreed upon sharing passwords with each other.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: OrgName(),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_rounded), label: 'Green Flags'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more), label: 'Description'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlue,
        onTap: _onItemTapped,
      ),
    );
  }
}
