import 'package:flutter/material.dart';
import 'package:golf/pages/event_detail.dart';
import 'package:golf/pages/event_page.dart';
import 'package:golf/pages/growth_page.dart';
import 'package:golf/pages/home_page.dart';
import 'package:golf/pages/profile_page.dart';
import 'package:golf/pages/ranking_page.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    EventPage(),
    RankingPage(),
    GrowthPage(),
    ProfilePage()
  ];
  void onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.lightGreenAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.assessment), label: "Rankings"),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Growth"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
