import 'package:flutter/material.dart';
class Room extends StatefulWidget {
  const Room({super.key});

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/Room.jpg'),
        fit: BoxFit.cover,),),
        child: Scaffold(
          backgroundColor:Colors.transparent,
          body:Center(
            child: Column(children: [
              SizedBox(height:60,),
              Image.asset('assets/logo.png',height:122,),
              Text('Select Game',style:TextStyle(fontSize:30.0,fontFamily: 'mafia',color:Colors.white),),
              SizedBox(height:10,),
              Container(
                color:Colors.transparent,height:560,width:372,child:ListView(children: [
                  Container(height:90,color:Colors.grey,child:Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                      Image.asset('assets/carom.png'),Image.asset('assets/11.png',height:71,),
                    ],),),
                SizedBox(height:20,),
                Container(height:90,color:Colors.grey,child:Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                  Image.asset('assets/carom.png'),Image.asset('assets/22.png',height:71,),
                ],),),


                SizedBox(height:20,),
                Container(height:90,color:Colors.grey,child:Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                  Image.asset('assets/freefire.png'),Image.asset('assets/11.png',height:71,),
                ],),),



                SizedBox(height:20,),
                Container(height:90,color:Colors.grey,child:Row(mainAxisAlignment:MainAxisAlignment.start,children: [
                  Image.asset('assets/freefire.png'),Image.asset('assets/22.png',height:71,),
                ],),),

              ],),
              )







            ] ,),

          ),
    ));
  }
}
