// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:signs/data/sample_questions.dart';
import 'package:signs/main.dart';
import 'package:signs/pages/results.dart';
import 'package:signs/services/ads_services.dart';
import 'package:signs/services/banner_ads.dart';

class QuizScreen extends StatefulWidget {
  final int personsCount;
  const QuizScreen({
    Key? key,
    required this.personsCount,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int questionPosition = 0;
  int score = 0;
  bool btnPressed = false;
  bool answered = false;
  String btnText = "Next Question";
  final PageController _controller = PageController(initialPage: 0);
  final PageController _parentController = PageController(initialPage: 0);
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  InterstitialAd? _interstitialAd;

  _createInterstitialAd() async {
    log('create interstaisl ad');
    try {
      log('intererasdasdasda');
      await InterstitialAd.load(
          adUnitId: AdHelper.interstitialAdUnitId,
          request: request,
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              log('$ad loaded sadasd');
              _interstitialAd = ad;
              // _numInterstitialLoadAttempts = 0;
              _interstitialAd!.setImmersiveMode(true);
            },
            onAdFailedToLoad: (LoadAdError error) {
              log('InterstitialAd failed to load: $error.');
              // _numInterstitialLoadAttempts += 1;
              _interstitialAd = null;
              // if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              //   _createInterstitialAd();
              // }
            },
          ));
    } on Exception catch (e) {
      debugPrintStack();
      log("EXCEPTION:${e.toString()}");
    }
  }

  _showInterstitialAd() {
    try {
      if (_interstitialAd == null) {
        log('Warning: attempt to show interstitial before loaded.');
        return;
      }
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) =>
            log('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          log('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          log('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createInterstitialAd();
        },
      );
      _interstitialAd!.show();
      _interstitialAd = null;
    } on Exception catch (e) {
      debugPrintStack();
      log("EXCEPTION:${e.toString()}");
    }
  }

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _createInterstitialAd();
    });
  }

  List<double> mapData = [];
  int currentChildPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: BannerAds(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Center(
            child: currentPage > widget.personsCount - 1
                ? null
                : Text(
                    "${box.get("ex$currentPage")}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                      fontSize: 45,
                    ),
                  ),
          ),
        ),
        backgroundColor: Color(0xffffffff),
        body: Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _parentController,
              itemCount: widget.personsCount,
              itemBuilder: (context, index) {
                return PageView.builder(
                  controller: _controller,
                  onPageChanged: (page) {
                    setState(() {
                      currentChildPage = page.toInt();
                    });

                    if (page == questions.length - 1 &&
                        currentPage > widget.personsCount - 1) {
                      setState(() {
                        btnText = "See Results";
                      });
                    }
                    setState(() {
                      answered = false;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Question ${index + 1}/${questions.length}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xff1062C2),
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Divider(
                              color: Color(0xff1062C2),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 150.0,
                              child: Text(
                                "${questions[index].question}",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            for (int i = 0;
                                i < questions[index].answers!.length;
                                i++)
                              Container(
                                width: double.infinity,
                                height: 45.0,
                                margin: EdgeInsets.only(
                                    bottom: 15.0, left: 12.0, right: 12.0),
                                child: RawMaterialButton(
                                  enableFeedback: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  fillColor: Color(0xff1062C2),
                                  onPressed: () async {
                                    mapData.add(
                                      questions[index]
                                          .answers!
                                          .values
                                          .toList()[i],
                                    );
                                    if (_controller.page?.toInt() ==
                                        questions.length - 1) {
                                      box.put(
                                        "user${currentPage}score",
                                        mapData.reduce((value, element) =>
                                            value + element),
                                      );

                                      setState(() {
                                        currentPage++;
                                      });

                                      if (currentPage >
                                          widget.personsCount - 1) {
                                        log(' I am here');
                                        await _createInterstitialAd();
                                        await _showInterstitialAd();
                                        Get.offAll(
                                            () => ResultScreen(score: score));
                                      } else {
                                        mapData.clear();

                                        _parentController.nextPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeInExpo);
                                        setState(() {
                                          currentChildPage = 0;
                                        });
                                      }
                                    } else {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.easeInExpo);
                                    }
                                  },
                                  child: Text(
                                    questions[index].answers!.keys.toList()[i],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                            SizedBox(
                              height: 80.0,
                            ),
                            Row(
                              mainAxisAlignment: currentChildPage == 0
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.spaceEvenly,
                              children: [
                                currentChildPage == 0
                                    ? const SizedBox()
                                    : RawMaterialButton(
                                        onPressed: () {
                                          _controller.previousPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeInExpo,
                                          );
                                        },
                                        shape: StadiumBorder(),
                                        fillColor: Color(0xff1062C2),
                                        padding:
                                            EdgeInsets.fromLTRB(24, 10, 24, 10),
                                        elevation: 5.0,
                                        child: Text(
                                          "Previous Question", //Next Question
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                RawMaterialButton(
                                  onPressed: () async {
                                    if (_controller.page?.toInt() ==
                                        questions.length - 1) {
                                      box.put("user$currentPage", mapData);

                                      setState(() {
                                        currentPage++;
                                      });

                                      if (currentPage >
                                          widget.personsCount - 1) {
                                        await _createInterstitialAd();
                                        await _showInterstitialAd();
                                        Get.offAll(
                                            () => ResultScreen(score: score));
                                      } else {
                                        mapData.clear();
                                        _parentController.nextPage(
                                            duration:
                                                Duration(milliseconds: 250),
                                            curve: Curves.easeInExpo);
                                      }
                                    } else {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 250),
                                          curve: Curves.easeInExpo);

                                      setState(() {
                                        btnPressed = false;
                                      });
                                    }
                                  },
                                  shape: StadiumBorder(),
                                  fillColor: Color(0xff1062C2),
                                  padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                                  elevation: 5.0,
                                  child: Text(
                                    btnText, //Next Question
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: questions.length,
                );
              }),
        ),
      ),
    );
  }
}
