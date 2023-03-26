import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:signs/pages/main_menu.dart';

String appName =
    'Compare My Exes'; // This is what will display in the upper left hand corner.

String storeUserName = "";
String storeUserName1 = "";
String storeUserName2 = "";
Box box = Hive.box("exesData");

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox("exesData");

  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: const MainMenu(),
    );
  }
}
