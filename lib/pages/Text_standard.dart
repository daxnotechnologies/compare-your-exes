import 'package:flutter/material.dart';
import 'package:signs/pages/standards_next.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/colors.dart';
import 'package:signs/shared/org_name.dart';

class StandardText extends StatefulWidget {
  const StandardText({super.key});

  @override
  State<StandardText> createState() => _StandardTextState();
}

class _StandardTextState extends State<StandardText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const BannerAds(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Green Flags',
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
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                          'This section highlights important topics that should be discussed and agreed between couples that intend to take their relationship to a serious level.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 16,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            sliver: SliverToBoxAdapter(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text:
                          'Topics include finances, family, lifeand goals. This can help eliminate future conflict adn set realistic expectations for the future relationship.',
                      style: TextStyle(
                          height: 1,
                          fontSize: 16,
                          wordSpacing: 1.0,
                          letterSpacing: 1.0))),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 75.0,
                color: Colors.transparent,
                child: Center(
                  child: RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const StandardNextScreen()));
                    },
                    shape: const StadiumBorder(),
                    fillColor: AppColor.secondaryColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 150.0,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: OrgName(),
            ),
          ),
        ],
      ),
    );
  }
}
