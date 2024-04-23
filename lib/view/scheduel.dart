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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Time Schedule",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
              Text("22/12/2024 - 27/12/2024 (QA)"),
              Image.asset("assets/schedu (1).png"),
              Image.asset("assets/Schedu (2).png")
            ],
          ),
        ),
      ),
    );
  }
}