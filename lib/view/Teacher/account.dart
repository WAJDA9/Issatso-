import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniprojet/view/student/signin_screen.dart';

class AccountT extends StatefulWidget {
  const AccountT({super.key});

  @override
  State<AccountT> createState() => _AccountState();
}

class _AccountState extends State<AccountT> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              
              child: Image.asset(
                height: 200,
                width: 200,
                "assets/e.jpeg")),
            Text("Dr. Slim Slim", style: TextStyle(fontSize: 15, )),
            Text("99111888", style: TextStyle(fontSize: 10,) ) ,
            Text("Docteur en mecatronique", style: TextStyle(fontSize: 8,) ) ,
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_outlined),
                  SizedBox(width: 17,),
                  Text("Profile"),
                  SizedBox(width: 1,),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            
            Container(
               margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.accessibility),
                  SizedBox(width: 17,),
                  Text("accessibility"),
                  SizedBox(width: 1,),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Container(
               margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: 17,),
                  Text("Settings"),
                  SizedBox(width: 1,),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Container(
            
               margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.card_membership),
                  SizedBox(width: 17,),
                  Text("Professor ID"),
                  SizedBox(width: 1,),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Container(
               margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.menu_book_outlined),
                  SizedBox(width: 17,),
                  Text("Information sheet"),
                  SizedBox(width: 1,),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.to(Signin());
              },
              child: Container(
                 margin: EdgeInsets.symmetric(horizontal: 50,vertical:17),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 17,),
                    Text("Logout",style: TextStyle(color: Colors.red),),
                    SizedBox(width: 1,),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
        
          ],
        
        ),
      ),
    );
  }
}