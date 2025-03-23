import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Setting Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stylish Bottom Bar'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: StylishBottomBar(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          option: AnimatedBarOptions(
            iconSize: 32,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.animated,
          ),
          items: [
            BottomBarItem(
              icon: Icon(Icons.home, ),
              title: Text(''),
              selectedColor: Colors.black,
              unSelectedColor: Colors.white,
            ),
            BottomBarItem(
              icon: Icon(Icons.search,),
              title: Text(''),
              selectedColor: Colors.black,
              unSelectedColor: Colors.white,

            ),
            BottomBarItem(
              icon: FaIcon(FontAwesomeIcons.shield),
              title: Text(''),
              selectedColor: Colors.black,
              unSelectedColor: Colors.white,
            ),
            BottomBarItem(
              icon: Icon(Icons.tune),
              title: Text(''),
              selectedColor: Colors.black,
              unSelectedColor: Colors.white,
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}