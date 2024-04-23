import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onchanged;
  final TextEditingController? controller;
  final String? error;

   TextFieldWidget({super.key, 
    required this.hintText,
    required this.obscureText,
    required this.onchanged, this.controller, this.error,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        margin: EdgeInsets.only(top: size.height*0.02),
        child: TextField(
          
          controller: controller,
          onChanged: onchanged,
          obscureText: obscureText,
          cursorColor:  Color.fromARGB(255, 0, 0, 0),
          style:  TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            errorText: error,
              labelStyle:  TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              focusColor:  Color(0xFF6190BA),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                     BorderSide(color: Color(0xFF6190BA)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                     BorderSide(color: Color(0xFF6190BA)),
              ),
              labelText: hintText),
        ));
  }
}
