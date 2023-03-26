import 'package:flutter/material.dart';
import 'package:signs/main.dart';
import 'package:signs/pages/description.dart';
import 'package:signs/pages/main_menu.dart';
import 'package:signs/services/banner_ads.dart';

import 'package:signs/pages/standards.dart';

class ExternalResources extends StatefulWidget {
  const ExternalResources({Key? key}) : super(key: key);

  @override
  State<ExternalResources> createState() => _ExternalResourcesState();
}

class _ExternalResourcesState extends State<ExternalResources> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainMenu(),
            ));
      } else if (index == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Describe(),
            ));
      } else if (index == 2) {
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
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff1062C2),
            title: Text(
              appName,
              style: TextStyle(
                  color: Colors.white,
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
                              '6 Common Traits of Narcissists and Gaslighters | Psychology Today\nhttps://www.psychologytoday.com/us/blog/communication-success/201707/6-common-traits-narcissists-and-gaslighters',
                          style: TextStyle(
                              color: Colors.black87,
                              height: 1,
                              fontSize: 14,
                              wordSpacing: 1.0,
                              letterSpacing: 1.0))))),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          '7 Gaslighting Phrases Malignant Narcissists, Sociopaths and Psychopaths Use To Silence You, Translated (psychcentral.com)\nhttps://psychcentral.com/blog/recovering-narcissist/2019/03/7-gaslighting-phrases-malignant-narcissists-sociopaths-and-psychopaths-use-translated',
                      style: TextStyle(
                          color: Colors.black87,
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'In a Relationship with a Narcissist? A Guide to Narcissistic Relationships (psychalive.org)\nhttps://www.psychalive.org/narcissistic-relationships',
                      style: TextStyle(
                          color: Colors.black87,
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          '20 Signs You May Be Dealing With a Psychopath (choosingtherapy.com)\nhttps://www.choosingtherapy.com/signs-of-a-psychopath/',
                      style: TextStyle(
                          color: Colors.black87,
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  text: TextSpan(
                      text:
                          'Warning signs you\'re dealing with a psychopath - CBT Psychology\nhttps://cbtpsychology.com/warning-signs-dealing-psychopath/',
                      style: TextStyle(
                          color: Colors.black87,
                          height: 1,
                          fontSize: 14,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          //   sliver: SliverToBoxAdapter(
          //     child: OrgName(),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more), label: 'Description'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_rounded), label: 'Green Flags')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff1062C2),
        onTap: _onItemTapped,
      ),
    );
  }
}
