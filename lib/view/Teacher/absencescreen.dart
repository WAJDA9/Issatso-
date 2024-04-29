import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojet/view/Teacher/sessionscreen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(color: Colors.black, Icons.settings))
        ],
        leading: Icon(
          Icons.supervised_user_circle,
          color: Color(0xFF6190BA),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text("Cours IHM \n Seance:s2   Salle:G16",
               textAlign: TextAlign.center,
              style: TextStyle(

                color: Colors.black, fontSize: 20)
               ),
            ),
            GestureDetector(onTap: (){
                      Get.to(
                        (Session())
                      );
                    },

              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF6190BA),
                  ),
                  child: Center(
                    
                      
                      child: Text(
                        'Start Session',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    
                  ),
                ),
            ),

          ],
        ),
      ),
    );
  }
}
