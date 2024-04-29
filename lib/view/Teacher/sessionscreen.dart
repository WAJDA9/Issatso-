import 'dart:async';

import 'package:flutter/material.dart';

class Session extends StatefulWidget {
  const Session({super.key});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 30);
  var minutes;
  var seconds;
  Duration initialDuration = Duration(minutes: 30);
  bool _isloading= true;
  bool SecondtStudent = true;
  bool ThirdStudent = true;
  List<TableRow> tableRows = [
  TableRow(children: [
 Text("Rami Chargui"),
                      Text("Present"),
                      Text("10:10")  ]),
  TableRow(children: [
 Text("Ayed Oussama"),
                      Text("Present"),
                      Text("10:11")  ]),
TableRow(children: [
  Text("Ahmed Gharbi"),
                      Text("Late"),
                      Text("10:25")]),];


  @override
  void initState() {
    
    super.initState();
    minutes = myDuration.inMinutes.remainder(60);
    seconds = myDuration.inSeconds.remainder(60);
  
  }
  

  void startTimer() {
    print("working");
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
 void resetTimer() {
  stopTimer();
  setState(() {
    myDuration = initialDuration;
    minutes = (myDuration.inMinutes).toString();
    seconds = (myDuration.inSeconds % 60).toString().padLeft(2, '0');
  });
}

  void setCountDown() {
  final reduceSecondsBy = 1;
  setState(() {
    final totalSeconds = myDuration.inSeconds - reduceSecondsBy;
    if (totalSeconds <= 0) {
      countdownTimer!.cancel();
      minutes = '0';
      seconds = '0';
    } else {
      myDuration = Duration(seconds: totalSeconds);
      minutes = (totalSeconds ~/ 60).toString();
      seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    }
  });
}

  
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
    setState(() {
      _isloading = false;
    });
  });
  Future.delayed(Duration(seconds: 7), () {
    setState(() {
      SecondtStudent= false;
    });
  });
  Future.delayed(Duration(seconds: 9), () {
    setState(() {
      ThirdStudent = false;
    });
  });
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Text(
              '$minutes:$seconds',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
              onPressed: startTimer,
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize:10,
                ),
              ),
            ),
            SizedBox(width: 7),
            ElevatedButton(
              onPressed: () {
                if (countdownTimer == null || countdownTimer!.isActive) {
                  stopTimer();
                }
              },
              child: Text(
                'Stop',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(width: 7),
            ElevatedButton(
                onPressed: () {
                  resetTimer();
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                )),

              ],
            ),
            SizedBox(height: 20),
            Visibility(child: CircularProgressIndicator(),
            visible: _isloading,
            ),
            Visibility(
              visible: !_isloading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      
                        Text(
                          style:TextStyle(fontWeight: FontWeight.bold),
                          "Student Name"),
                       
                       Text(
                           style:TextStyle(fontWeight: FontWeight.bold),
                          "State"),
                      
                       Text(
                           style:TextStyle(fontWeight: FontWeight.bold),
                          "Checkin Time"),
                      
                    ]
                  ),
                   Divider(color: Colors.black,),
                   SizedBox(height: 10,),
                  
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [ Text("Rami Chargui"),
                      Text("Present"),
                      Text("10:10")],),
                      SizedBox(height: 10,),
                     
                Visibility(
                  visible: !SecondtStudent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ Text("Ayed Oussama"),
                        Text("Present"),
                        Text("10:11")],),
                ),
                SizedBox(height: 10,),
                Visibility(
                  visible: !SecondtStudent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ Text("Wajdi Zakhama"),
                        Text("Present"),
                        Text("10:12")],),
                ),
                SizedBox(height: 10,),
                Visibility(
                  visible: !ThirdStudent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ Text("Ahmed Gharbi"),
                        Text("Late"),
                        Text("10:25")],),
                ),
                SizedBox(height: 10,),
                Visibility(
                  visible: !ThirdStudent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [ Text("Amor Hana"),
                        Text("Late"),
                        Text("10:26")],),
                ),
                SizedBox(height: 10,),
              ]),
            ),
            SizedBox(height: 10,),

            Visibility(
              visible: false,
              child: Table(
                border: TableBorder.all(),
                defaultColumnWidth: const FixedColumnWidth(170),
            
                children: [
                   TableRow(
                    children: [
                      
                       Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                         child: Text(
                          style:TextStyle(fontWeight: FontWeight.bold),
                          "Student Name"),
                       ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                           style:TextStyle(fontWeight: FontWeight.bold),
                          "State"),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                           style:TextStyle(fontWeight: FontWeight.bold),
                          "Checkin Time"),
                      )
                    ]
                  ),
                   TableRow(
                    children: [
                       Text("Rami Chargui"),
                      Text("Present"),
                      Text("10:10")
                    ]
                  ),
                   TableRow(
                    children: <Widget>[
                      Text("Ayed Oussama"),
                      Text("Present"),
                      Text("10:11")
                    ]
                  ),
                    TableRow(
                    children: <Widget>[
                       Text("Ahmed Gharbi"),
                      Text("Late"),
                      Text("10:25")
                    ]
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
