import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:play/ui/homePages/profliePage.dart';


import 'gamelistPage.dart';
import 'gameroomPage.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
////3 main pages with there class
 int index = 1;
  final screens =[
    profile(),
    gamelist(),
    Friends(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      SizedBox(child: Image.asset('assets/money-bag.png'),height:35,),
      SizedBox(child: Image.asset('assets/mainlogo.png'),height:44,),
      SizedBox(child: Image.asset('assets/man.png'),height:44,),
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/home.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:screens[index],
          bottomNavigationBar:CurvedNavigationBar(items:items,height:60,index:index,backgroundColor:Colors.transparent,
              color:Colors.yellowAccent,
            ///////this function change Navigation
              onTap:(index) => setState(() => this.index = index),
              ),
        ),
      ),
    );
  }
}






