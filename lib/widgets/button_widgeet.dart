import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _Buttontext;
  final VoidCallback onClick;
   Button(this._Buttontext, {super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialButton(
      minWidth: size.width,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding:  EdgeInsets.fromLTRB(40, 20, 40, 20),
      color:  Color(0xFF6190BA), 
      textColor: Colors.white, 
      onPressed: onClick,
      child: Text(_Buttontext),
    );
  }
}
