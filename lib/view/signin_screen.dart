

import 'package:get/get.dart';
import 'package:miniprojet/view/homescreen.dart';
import 'package:miniprojet/view/signup_screen.dart';
import 'package:miniprojet/widgets/button_widgeet.dart';

import '../widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
   Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
 
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

                Get.to( 
                  ()=>Home()
                );
                
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
