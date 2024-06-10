import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/home.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        body:Center(
          child: Column(children: [
            SizedBox(height:110,),
            Image.asset('assets/upload.png',height:111,),
            SizedBox(height:18,),
            Text("Bala Murugan",style:TextStyle(fontSize:26,fontFamily: 'mafia',fontWeight:FontWeight.bold),),
            SizedBox(height:16,),
            Row(children: [SizedBox(width:128,),Image.asset('assets/money-bag.png',height:40,),SizedBox(width:16,),
              Text("₹100",style:TextStyle(fontSize:22,fontFamily: 'mafia',fontWeight:FontWeight.bold),),],),
            SizedBox(height:17,),
            Image.asset('assets/addm.png',height:72,),
            SizedBox(height:10,),
            Image.asset('assets/bank.png',height:72,),
            SizedBox(height:10,),
            Image.asset('assets/info.png',height:72,),
            SizedBox(height:10,),
            Image.asset('assets/history.png',height:72,),

          ],),
        ),
      ),
    );
  }
}


