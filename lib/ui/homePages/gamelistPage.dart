import 'package:flutter/material.dart';

class gamelist extends StatefulWidget {
  const gamelist({super.key});

  @override
  State<gamelist> createState() => _gamelistState();
}

class _gamelistState extends State<gamelist> {
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
        backgroundColor: Colors.transparent,
        body:Column(
          children: [
            SizedBox(height: 100,),
            Row(children: [SizedBox(width:140,),
              RawMaterialButton(onPressed:(){
                showModalBottomSheet(context: context, builder:(BuildContext context){
                  return SizedBox(
                    height:300,
                    child:Column(
                      children: [
                        SizedBox(height:20,),
                        Row(
                          children: [
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/2.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/5.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/10.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/25.png',height:72,))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/50.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/100.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/250.png',height:72,))),
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/500.png',height:72,))),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: IconButton(onPressed: null, icon:Image.asset('assets/free.png',height:72,))),
                            Expanded(child: ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:Colors.black)
                              ,child:Text("Close",style:TextStyle(color:Colors.red,fontFamily: 'mafia',fontWeight:FontWeight.bold),),onPressed:(){Navigator.pop(context);},)),
                          ],
                        ),
                      ],
                    ),
                  );
                });
              },elevation:1.0,child:Image.asset('assets/carom.png',height:70,),shape:CircleBorder()),
              SizedBox(width:40,),

              RawMaterialButton(onPressed:null,elevation:1.0,child:Image.asset('assets/freefire.png',height:70,),shape:CircleBorder()),
            ],
            ),
          ],
        ),
      ),
    );
  }
}
