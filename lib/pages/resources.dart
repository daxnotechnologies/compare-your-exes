import 'package:flutter/material.dart';
import 'package:signs/shared/app_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../shared/colors.dart';

class Resources extends StatelessWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.2),
      child: Column(
        children: [
          AppBar(
            backgroundColor: const Color(0xff1062C2),
            title: Text(
              appName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            centerTitle: true,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: InkWell(
              onTap: () async {
                try {
                  await launchUrl(
                    Uri.parse("https://www.greatlakesconsultant.com/"),
                  );
                } catch (e) {
                  AppSnackbar.showSnackbar(context, message: "Server Error");
                }
              },
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/banner.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RawMaterialButton(
            onPressed: () async {
              try {
                await launchUrl(
                  Uri.parse("https://www.greatlakesconsultant.com/"),
                );
              } catch (e) {
                AppSnackbar.showSnackbar(context, message: "Server Error");
              }
            },
            shape: const StadiumBorder(),
            fillColor: AppColor.secondaryColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Text(
                "Relationship Coaching",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
