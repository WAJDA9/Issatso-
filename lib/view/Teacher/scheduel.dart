import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Schedule {
  final String day;
  final String startTime;
  final String endTime;
  final String subject;
  final String teacher;
  final String type;
  final String room;
  final String regime;

  Schedule({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.teacher,
    required this.type,
    required this.room,
    required this.regime,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      day: json['Jours'],
      startTime: json['Début'],
      endTime: json['Fin'],
      subject: json['Matière'],
      teacher: json['Enseignant'],
      type: json['Type'],
      room: json['Salle'],
      regime: json['Régime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Jours': day,
      'Début': startTime,
      'Fin': endTime,
      'Matière': subject,
      'Enseignant': teacher,
      'Type': type,
      'Salle': room,
      'Régime': regime,
    };
  }
}

class ScheduelScreenT extends StatefulWidget {
  const ScheduelScreenT({super.key});

  @override
  State<ScheduelScreenT> createState() => _ScheduelScreenState();
}

class _ScheduelScreenState extends State<ScheduelScreenT> {
  String classe = "ING-A2-GL-03";
  Future<List<Schedule>> fetchSchedule() async {
    final response = await http.get(Uri.parse(
        'https://win-nerkech-api.azurewebsites.net/api/groups/${classe}/'));

    if (response.statusCode == 200) {
      List<Schedule> schedules = [];
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));

      print(jsonData['timetable_info_json']['num_rows']);

      for (var i = 1; i <= jsonData['timetable_info_json']['num_rows']; i++) {
        var row = List<String>.from(jsonData['timetable_info_json']['row_$i']);
        schedules.add(Schedule.fromJson({
          'Jours': row[0],
          'Début': row[1],
          'Fin': row[2],
          'Matière': row[3],
          'Enseignant': row[4],
          'Type': row[5],
          'Salle': row[6],
          'Régime': row[7],
        }));
      }
      print(schedules);
      return schedules;
    } else {
      throw Exception('Failed to load schedule');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Table'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DropdownMenu(
              width: 300,
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(
                  
                  fontSize: 16,
                  fontFamily: 'ArimaMadurai',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    style: BorderStyle.solid,
                    width: 2,
                    color: Color(0xFF6190BA)),
                )
                
              ),
              enableFilter: true,
              label: const Text("Select a Class"),
              onSelected: (value) {
                setState(() {
                  classe = value!;
                  controller.clear();
                });
              },
              controller: controller,
              dropdownMenuEntries: <DropdownMenuEntry<String>>[
                DropdownMenuEntry(
                  label: 'ING-A2-GL-01',
                  value: "ING-A2-GL-01",
                ),
                DropdownMenuEntry(
                  label: 'ING-A2-GL-02',
                  value: "ING-A2-GL-02",
                ),
                DropdownMenuEntry(
                  label: 'ING-A2-GL-03',
                  value: "ING-A2-GL-03",
                ),
                DropdownMenuEntry(
                  label: 'ING-A2-GL-04',
                  value: "ING-A2-GL-04",
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            FutureBuilder<List<Schedule>>(
              future: fetchSchedule(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      
                      border: TableBorder.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      columns: <DataColumn>[
                        for (var header in snapshot.data![0].toJson().keys)
                          DataColumn(
                              label: Text(
                            header,
                            style: TextStyle(
                                fontFamily: 'ArimaMadurai', fontSize: 16),
                          )),
                      ],
                      rows: <DataRow>[
                        for (var index = 0;
                            index < snapshot.data!.length;
                            index++)
                          DataRow(
                            color: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (index % 2 == 0) {
                                return Color(0xFF6190BA);
                              } else {
                                return Color.fromARGB(255, 40, 67, 91);
                              }
                            }),
                            cells: [
                              for (var cell
                                  in snapshot.data![index].toJson().values)
                                DataCell(
                                  Text(
                                    cell,
                                    style: TextStyle(
                                        fontFamily: 'ArimaMadurai', fontSize: 16),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
