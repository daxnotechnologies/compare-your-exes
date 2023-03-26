// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:signs/pages/Text_standard.dart';
import 'package:signs/pages/external_resources.dart';
import 'package:signs/pages/main_menu.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/app_snackbar.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ads/banner.dart';
import '../main.dart';
import 'package:restart_app/restart_app.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int get finalScore => widget.score; // scoring 1:1, nothing complicated!
  String explanation = '';
  String type = '';

  // String storeUserName = Name().get();
  int _selectedIndex = 0;
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
              builder: (context) => ExternalResources(),
            ));
      } else if (index == 2) {
        // Added to provide the standards resources at the bottom of the results page. :)
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StandardText(),
            ));
      }
    });
  }

  double calculatePercentage(int index) {
    return (box.get("user${index}score") / 12 * 100);
  }

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  bool get isSameValue {
    if (box.get("user0score") == box.get("user1score") &&
        box.get("user1score") == box.get("user2score")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    data = List.generate(
      box.get("personCount"),
      (index) => _ChartData(
        box.get("ex$index"),
        isSameValue ? 100 : calculatePercentage(index),
      ),
    );

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (finalScore <= 8) {
      explanation =
          "$storeUserName has a low probability of being a Playa, but that doesn't mean he is husband material either.";

      type = "Normal";
    } else if (finalScore > 8 && finalScore <= 17) {
      explanation =
          "$storeUserName has Playa tendencies. Be careful about opening up your heart to this person.";
      type = "Problematic";
    } else if (finalScore > 17 && finalScore <= 20) {
      explanation =
          "$storeUserName is Certified Playa!!! Get out of the Relationship or continue to have your kindness taking advantage of.";

      type = "Critical";
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: BannerAds(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  try {
                    await launchUrl(
                      Uri.parse("https://www.greatlakesconsultant.com/"),
                    );
                  } catch (e) {
                    AppSnackbar.showSnackbar(context, message: "Server Error");
                  }
                },
                child: Image.asset(
                  "assets/images/blue_banner.jpg",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Here is the comparison!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(
                        associatedAxisName: "Pers",
                        isVisible: true,
                        title: AxisTitle(
                          textStyle: TextStyle(
                            height: 2,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Exes Names",
                        ),
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 100,
                        interval: 10,
                        title: AxisTitle(
                          textStyle: TextStyle(
                            height: 2,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Percentage of Similarity",
                        ),
                      ),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<_ChartData, String>>[
                        ColumnSeries<_ChartData, String>(
                          pointColorMapper: (datum, index) {
                            if (calculatePercentage(index) < 30) {
                              return Color(0xff64D9EA);
                            } else if (calculatePercentage(index) < 60) {
                              return Color(0xff64D9EA);
                            } else {
                              return Color(0xff64D9EA);
                            }
                          },
                          dataSource: data,
                          xAxisName: "Percentage",
                          yAxisName: "Exes Names",
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: '',
                          color: Color.fromARGB(255, 81, 151, 231),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 200,
                  child: Column(
                    children: List.generate(
                      box.get("personCount"),
                      (index) => ListTile(
                        title: Text(
                          box.get("ex$index"),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        trailing: Container(
                          height: 50,
                          width: 50,
                          color: calculatePercentage(index) < 30
                              ? Color(0xff64D9EA)
                              : calculatePercentage(index) < 60
                                  ? Color(0xff64D9EA)
                                  : Color(0xff64D9EA),
                          child: Center(
                            child: Text(
                              isSameValue
                                  ? "100.0%"
                                  : "${calculatePercentage(index).toStringAsFixed(2)}%",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  /// Fill webOrigin only when your new origin is different than the app's origin
                  Restart.restartApp();
                },
                child: Text("Back to Home"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                    "If your graph shows a pattern of negativity, it’s time to make a change! You can change your Relationship Choices Right Now!"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () async {
                  await launchUrl(
                      Uri.parse("https://www.greatlakesconsultant.com/"));
                },
                child: Text("Hyperlink to my Website!"),
              ),
              SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BoxAd(),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
