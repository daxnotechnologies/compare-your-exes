import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:signs/main.dart';
import 'package:signs/pages/resources.dart';
import 'package:signs/pages/videos.dart';
import 'package:signs/services/banner_ads.dart';
import 'package:signs/shared/app_snackbar.dart';
import 'package:signs/shared/logo.dart';
import 'package:signs/shared/start_button.dart';
import 'package:signs/pages/standards.dart';

import 'description.dart';
import 'disclaimer.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late Box box;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  addExesData(int index, String name) {
    box.put("ex$index", name);
  }

  @override
  void initState() {
    box = Hive.box("exesData");
    super.initState();
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  int personsCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const BannerAds(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xffffffff),
      body: _selectedIndex == 0
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
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
                  floating: true,
                ),
                const SliverToBoxAdapter(
                  child: Logo(),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(
                    bottom: 30,
                    left: 20,
                    right: 20,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "This assessment is designed to look for patterns from your previous relationships to help you identify negative factors to be on the lookout for in your future relationships.",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        TextField(
                          controller: _controller,
                          onChanged: (value) {
                            setState(
                              () => storeUserName = value,
                            );
                          },
                          maxLength: 70,
                          decoration: const InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Name of Ex 1",
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 1.0)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                    color: Colors.black, width: 2.0)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _controller1,
                          onChanged: (value) {
                            setState(
                              () => storeUserName1 = value,
                            );
                          },
                          maxLength: 70,
                          decoration: const InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText:
                                "Name of Ex 2", // Added to make hintText more legible!
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _controller2,
                          onChanged: (value) {
                            setState(
                              () => storeUserName2 = value,
                            );
                          },
                          maxLength: 70,
                          decoration: const InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: "Name of Ex 3",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 100.0),
                  sliver: SliverToBoxAdapter(
                    child: StartButton(
                      addData: () async {
                        await Hive.openBox("exesData");
                        if (_controller.text.isEmpty) {
                          AppSnackbar.showSnackbar(context,
                              message: "Please Enter your Ex Name");
                        } else if (_controller1.text.isEmpty) {
                          AppSnackbar.showSnackbar(context,
                              message: "Please Enter your Ex Name");
                        } else {
                          if (_controller2.text.isNotEmpty) {
                            setState(() {
                              personsCount = personsCount + 1;
                            });
                          }
                          addExesData(0, storeUserName);
                          addExesData(1, storeUserName1);
                          addExesData(2, storeUserName2);

                          box.put("personCount", personsCount);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Disclaimer(),
                            ),
                          );
                          final player = AudioPlayer();
                          player.setReleaseMode(ReleaseMode.loop);
                          player.play(
                            AssetSource('music/calming_piano.m4a'),
                            volume: 0.3,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          : _selectedIndex == 1
              ? const Resources()
              : _selectedIndex == 2
                  ? const Standards()
                  : VideoListScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.read_more), label: 'Coaching'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant_rounded),
              label: 'Green Flags'), // Added for Standards Page add in!
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: 'Videos') // Added for Standards Page add in!
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff1062C2),
        unselectedItemColor: const Color(0xff1062C2),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
