import 'dart:developer';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_helper.dart';

class QestionAd {
  static InterstitialAd? _ad;
  static bool isAddReady = false;

  static void loadSaveAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.questionsAd,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            isAddReady = true;
            _ad = ad;
          },
          onAdFailedToLoad: (error) {
            log("error${error.toString()}");
            // C. toast(msg: "Loaded ad faile");
          },
        ));
  }

  static showSaveAd() {
    if (isAddReady) {
      _ad!.show();
    }
  }
}
