import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
                "assets/image.png")),
            Text("Wajdi Zakhama", style: TextStyle(fontSize: 15, )),
            Text("99218004", style: TextStyle(fontSize: 10,) ) ,
            Text("ING A2-GL-03", style: TextStyle(fontSize: 8,) ) ,
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
                  Text("Student Card"),
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
            Container(
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
        
          ],
        
        ),
      ),
    );
  }
}