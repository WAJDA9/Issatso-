

import 'dart:convert';

import 'package:get/get.dart';
import 'package:miniprojet/models/student.dart';
import 'package:miniprojet/view/Teacher/homescreen.dart';
import 'package:miniprojet/view/student/homescreen.dart';
import 'package:miniprojet/view/student/signup_screen.dart';

import 'package:miniprojet/widgets/button_widgeet.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniprojet/widgets/input_field_widget.dart';

class Signin extends StatefulWidget {
   Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
   String quote='';
  Future getQuote()  async {
    var response = await http.get(Uri.https('c044-197-238-127-59.ngrok-free.app','student'));
    print(response);
    var json = jsonDecode(response.body);
    print(json);
     
   }
 
 String? errorMessage ='' ; 
  String? errorPassMessage ='' ; 
  TextEditingController emailcontroller=TextEditingController();
    TextEditingController passcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor:  Color.fromARGB(255, 244, 242, 242),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Logo.png",
            height: 230,
            width: 230,
            ),
            Text('Log in to your account',
                style: GoogleFonts.arima(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
            TextFieldWidget(
                hintText: 'Email', obscureText: false, onchanged: (value) {},controller: emailcontroller,error: (errorMessage=="" ? null:errorMessage)),
            TextFieldWidget(
             
                hintText: 'Password', obscureText: true, onchanged: (value) {},controller: passcontroller,error: (errorMessage=="" ? null:errorPassMessage),),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              'Sign in',
              onClick: () {
                  setState(() {
                  errorMessage="";
                  errorPassMessage="";
                });

                if (GetUtils.isEmail(emailcontroller.text)&& (passcontroller.text!="")){
                Get.snackbar(
                  snackPosition: SnackPosition.BOTTOM,
                  "Success", "loged in",
                      backgroundColor: Color.fromARGB(132, 76, 244, 135));

                if(emailcontroller.text.contains("wajdi")){
                  Get.to( 
                  ()=>Home()
                );
                }
                else{
                  Get.to(HomeT());
                }
                Student student=Student(firstname: 'wajdi',lasrname: 'wajdi',email: "wajdi@gmail.com",password: "wa",ncin: "12345678",gender: "male",departmentId: "1");
                 print(student.toJson());
                 http.post(Uri(path: "https://c044-197-238-127-59.ngrok-free.app/student"),
                 body: student.toJson()
                 );
                 print(http.get(Uri(path: "https://c044-197-238-127-59.ngrok-free.app/student")));
                  
                
                }
                else {
                  if((passcontroller.text=="")){
                    setState(() {
                     errorPassMessage="Please specify a password";
                    });

                  }
                  if(!GetUtils.isEmail(emailcontroller.text)){
                    setState(() {
                     errorMessage="Non valid email";
                    });
                  }
                  
                Get.snackbar(
                  snackPosition: SnackPosition.BOTTOM,
                  "error", "${errorMessage} / ${errorPassMessage}",
                      backgroundColor: Color.fromARGB(132, 248, 49, 49));
                }
                
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
               Text('Forgot Your Password?'),
              GestureDetector(
                onTap: () {
                  getQuote();
                },
                child:  Text(
                  'Reset It',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ])
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            margin:  EdgeInsets.only(bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text('Don\'t have an account?'),
                  GestureDetector(
                    onTap: () {
                      
                      Get.to(
                        
                        () =>  Signup(),
                      );
                    },
                    child:  Text(
                      'Sign Up',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ])),
      ),
    );
  }
}
