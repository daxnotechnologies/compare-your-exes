import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BoxAd extends StatefulWidget {
  const BoxAd({Key? key}) : super(key: key);

  @override
  State createState() => _BoxAdState();
}

class _BoxAdState extends State<BoxAd> {
  AdSize size = AdSize.banner;
  BannerAd? _bannerAd;
  bool isReady = false;

  void initBanner() {
    _bannerAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-8666457702645053/8741897352'
          : 'ca-app-pub-8666457702645053/4903612745',
      size: size,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isReady = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        log('Banner ad Error');
      }),
    );
    _bannerAd!.load();
  }

  @override
  void initState() {
    super.initState();
    initBanner();
  }

  @override
  Widget build(BuildContext context) {
    if (isReady) {
      return Container(
        width: size.width.toDouble(),
        height: 35,
        alignment: Alignment.center,
        child: AdWidget(ad: _bannerAd!),
      );
    }
    return const SizedBox();
  }
}
