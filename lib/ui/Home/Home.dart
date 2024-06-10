import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../Account/Profile.dart';
import '../Games/Friends.dart';
import '../Games/List.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
////3 main pages with there class
  int index = 1;
  final List<Widget> screens = <Widget>[
    const ProfilePage(),
    const GameListPage(),
    const Friends(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[
      SizedBox(
        height: 35,
        child: Image.asset('assets/money-bag.png'),
      ),
      SizedBox(
        height: 44,
        child: Image.asset('assets/mainlogo.png'),
      ),
      SizedBox(
        height: 44,
        child: Image.asset('assets/man.png'),
      ),
    ];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            items: items, height: 60, index: index, backgroundColor: Colors.transparent,
            color: Colors.yellowAccent,
            ///////this function change Navigation
            onTap: (int index) => setState(() => this.index = index),
          ),
        ),
      ),
    );
  }
}
