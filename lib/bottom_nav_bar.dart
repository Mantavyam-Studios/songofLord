import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Bookmark Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Character Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: StylishBottomBar(
            backgroundColor: CupertinoColors.lightBackgroundGray,
            option: AnimatedBarOptions(
              iconSize: 40,
              barAnimation: BarAnimation.fade,
              iconStyle: IconStyle.animated,
            ),
            items: [
              BottomBarItem(
                icon: Icon(
                  _selectedIndex == 0 ? Icons.home : Icons.home_outlined,  // Solid when selected
                  color: _selectedIndex == 0 ? Colors.black : Colors.white,
                ),
                title: Text(''),
                selectedColor: Colors.black,
                unSelectedColor: Colors.white,
              ),
              BottomBarItem(
                icon: Icon(
                  _selectedIndex == 1 ? Icons.bookmark : Icons.bookmark_border,  // Solid when selected
                  color: _selectedIndex == 1 ? Colors.black : Colors.white,
                ),
                title: Text(''),
                selectedColor: Colors.black,
                unSelectedColor: Colors.white,
              ),
              BottomBarItem(
                icon: Image.asset(
                  'assets/icons/sword.png',
                  width: 30,
                  height: 30,
                  color: _selectedIndex == 2 ? Colors.black : Colors.white,  // Change color when selected
                ),
                title: Text(''),
                selectedColor: Colors.black,
                unSelectedColor: Colors.white,
              ),
              BottomBarItem(
                icon: Icon(
                  _selectedIndex == 3 ? Icons.tune : Icons.tune_outlined,  // Solid when selected
                  color: _selectedIndex == 3 ? Colors.black : Colors.white,
                ),
                title: Text(''),
                selectedColor: Colors.black,
                unSelectedColor: Colors.white,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
