import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:helpcare/screens/bonus/bonus_screen.dart';
import 'package:helpcare/screens/doacao/doacao_screen.dart';
import 'package:helpcare/screens/home/home_screen.dart';

class Home2Screen extends StatefulWidget {
  Home2Screen({Key key}) : super(key: key);

  @override
  _Home2ScreenState createState() => _Home2ScreenState();
}

class _Home2ScreenState extends State<Home2Screen> {
  PageController _pageController;

  // _Home2ScreenState(this._pageController);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomeScreen(),
          DoacaoScreen(),
          BonusScreen(),
        ],
        onPageChanged: (int index) {
          setState(
            () {
              _pageController.jumpToPage(index);
            },
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOutBack,
        index: 0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.monetization_on,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.redeem,
            size: 30,
            color: Colors.white,
          ),
          // Icon(Icons.group, size: 30, color: Colors.white),
          // Icon(Icons.person, size: 30, color: Colors.white)
        ],
        color: Colors.blueAccent,
        backgroundColor: Colors.white,
        height: 60.0,
        onTap: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
