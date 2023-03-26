// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:signs/main.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/describe_button.dart';

import '../ads/banner.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({Key? key}) : super(key: key);

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
                          'All content and media on this app is created and published online for informational purposes only. It is not intended to be a substitute for professional medical advice and should not be relied on as health or personal advice.',
                      style: TextStyle(
                          color: Colors.black87,
                          height: 1.0,
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
                      'Always seek the guidance of your doctor or other qualified health professional with any questions you may have regarding your health or a medical condition. Never disregard the advice of a medical professional, or delay in seeking it because of something you have read on this Website.',
                  style: TextStyle(
                    color: Colors.black87,
                    height: 1,
                    fontSize: 14,
                    wordSpacing: 1.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                text: TextSpan(
                  text:
                      'If you think you may have a medical emergency, call your doctor, go to the nearest hospital emergency department, or call the emergency services immediately. If you choose to rely on any information provided by Great Lakes Creative Solutions, you do so solely at your own risk.',
                  style: TextStyle(
                    color: Colors.black87,
                    height: 1,
                    fontSize: 14,
                    wordSpacing: 1.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                text: TextSpan(
                  text:
                      'External (outbound) links to other websites or educational material (e.g. pdf’s etc.…) that we have not explicitly created are followed at your own risk. Under no circumstances is Great Lakes Creative Solutions responsible for the claims of third party websites or educational providers.',
                  style: TextStyle(
                    color: Colors.black87,
                    height: 1,
                    fontSize: 14,
                    wordSpacing: 1.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: DescribeButton(),
            ),
          ),
        ],
      ),
      bottomNavigationBar:BoxAd(),
    );
  }
}
