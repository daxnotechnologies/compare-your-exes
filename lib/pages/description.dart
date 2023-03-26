// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signs/main.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/disclaimer_button.dart';

class Describe extends StatelessWidget {
  const Describe({Key? key}) : super(key: key);

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
                  fontSize: 18.0,
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
                      'This assessment is designed to test for Dark Triad personality traits, typically described as narcissistic, Machiavellian, and psychopathy. Narcissistic is extreme self-involvement that makes a person ignore the needs of those around them. Machiavellianism is a vague measurement of manipulative or scheming behavior. Psychopathy is partially characterized by a lack of empathy and indifference to the suffering of others. At the end of the assessment the individual being tested will receive a “Dark Triad” score between 0 and 100. The higher the score, the more likely the individual possess traits that bring stress and discomfort to their interpersonal relationships.',
                  style: TextStyle(
                      color: Colors.black87,
                      height: 1.25,
                      fontSize: 17,
                      wordSpacing: 1.5,
                      letterSpacing: 1.0),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: DisclaimerButton(),
            ),
          ),
        ],
      ),
    );
  }
}
