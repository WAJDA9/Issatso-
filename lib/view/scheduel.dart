import 'package:flutter/material.dart';

class Scheduel extends StatefulWidget {
  const Scheduel({super.key});

  @override
  State<Scheduel> createState() => _ScheduelState();
}

class _ScheduelState extends State<Scheduel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text("Time Schedule"),
            Text("22/12/2024 - 27/12/2024 (QA)"),
            Image.asset("assets/schedu (1).png"),
            Image.asset("assets/Schedu (2).png")
          ],
        ),
      ),
    );
  }
}