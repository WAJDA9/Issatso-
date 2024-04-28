import 'package:flutter/material.dart';
import 'package:miniprojet/models/course.dart';
import 'package:url_launcher/url_launcher.dart';

class Courses extends StatefulWidget {
  Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
   List<Course> courses = [];

  final List<Course> securite = [Course("Tp1", 'https://issatso.rnu.tn/bo/storage/app/public/courses/wJRcpOIKFtumAQxoNNfAzJWMqd8ymW3npeBoM9eB.pdf', "25/01/2024"), Course("TP2", 'https://issatso.rnu.tn/bo/storage/app/public/courses/HTZCpIQeP0FcuAe18rwveFHYHeHl0QO60kt8GwjK.pdf', "01/01/2024"), Course("DS", 'https://issatso.rnu.tn/bo/storage/app/public/courses/8tq79bAwT5pLOd4kJFW0kH8BGzL7yjVnVE67INgs.pdf', "22/03/2024")];

  final List<Course> web = [Course("Tp1", 'https://issatso.rnu.tn/bo/storage/app/public/courses/wJRcpOIKFtumAQxoNNfAzJWMqd8ymW3npeBoM9eB.pdf', "25/01/2024"), Course("TP2", 'https://issatso.rnu.tn/bo/storage/app/public/courses/HTZCpIQeP0FcuAe18rwveFHYHeHl0QO60kt8GwjK.pdf', "01/01/2024"), Course("DS", 'https://issatso.rnu.tn/bo/storage/app/public/courses/8tq79bAwT5pLOd4kJFW0kH8BGzL7yjVnVE67INgs.pdf', "22/03/2024")];

  final List<Course> bd = [Course("Tp1", 'https://issatso.rnu.tn/bo/storage/app/public/courses/TS99Vl0PYf39KQuK3sqYc2Yd4AAFEVTHi4QRHG5m.pdf', "25/02/2024"), Course("TP2", 'https://issatso.rnu.tn/bo/storage/app/public/courses/N5isakQfkleAhNGIwRxQgJ4ZogAD8KN7vhE59PsD.pdf', "22/03/2024")];

  final List<Course> mini = [Course("Projet", 'https://issatso.rnu.tn/bo/storage/app/public/courses/wJRcpOIKFtumAQxoNNfAzJWMqd8ymW3npeBoM9eB.pdf', "Jan 29,2024")];

  Future<void> downloadFile(String fileurl) async {
  
    if (await canLaunchUrl(Uri.parse(fileurl))) {
      await launchUrl(Uri.parse(fileurl));
    } else {
      throw 'Could not launch $fileurl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Column(
        children: [
          SizedBox(height: 7,),
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
            label: const Text("Select a Subject"),
            onSelected: (value){
              setState(() {
                if (value == "securite") courses=securite;
                if (value == "web") courses=web;
                if (value == "bd") courses=bd;
                if (value == "mini") courses=mini;
                controller.clear();
              });   
            },
            controller: controller,
            dropdownMenuEntries: 
            <DropdownMenuEntry<String>>[
              DropdownMenuEntry(
                label: 'Sécurité',
                
                value: "securite",
              ),
              DropdownMenuEntry(
                label: 'Web',
                value: "web",
              ),
              DropdownMenuEntry(
                label: 'BD avancé',
                value: "bd",
              ),
              DropdownMenuEntry(
                label: 'Mini Projet',
                value: "mini",
              ),
            ],
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    iconColor: Color(0xFF6190BA),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Color(0xFF6190BA)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(courses[index].name),
                    subtitle: Text(courses[index].publishdate),
                    trailing: IconButton(
                      icon: Icon(Icons.file_download),
                      onPressed: () {
                        downloadFile(courses[index].url);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
