import 'package:fingerprint/screens/home.dart';
import 'package:fingerprint/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../utilities/colors.dart';
import '../utilities/font.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: white,
        currentIndex: currentindex,
        iconSize: 25,
        elevation: 0,
        selectedLabelStyle: selectedtitlestyle,
        unselectedLabelStyle: unselectedtitlestyle,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blue,
        unselectedItemColor: grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(IconlyLight.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.setting), label: "Settings")
        ],
        onTap: changeIndex,
      ),
    );
  }

  changeIndex(index) => setState(() => currentindex = index);
}
