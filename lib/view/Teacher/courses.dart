import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:miniprojet/models/course.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursesT extends StatefulWidget {
  CoursesT({super.key});

  @override
  State<CoursesT> createState() => _CoursesState();
}
PlatformFile? _file;

  

class _CoursesState extends State<CoursesT> {
   Future<void> _getImage() async {
    final pickedFiles = await FilePicker.platform.pickFiles();
    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      setState(() {
        _file = pickedFiles.files.first;
      });

    }
    //  try {
    //   final storage = AzureStorage.parse(connectionString);
    //   final result = await storage.putBlob(
    //     'containerName', // Your Azure Storage container name
    //     file.name ?? 'filename', // Specify a filename or use the original file name
    //     file.bytes!,
    //     contentType: 'application/pdf', // Specify the content type of your file
    //   );
    //   print('File uploaded successfully. Blob URL: ${result?.uri}');
    // } catch (e) {
    //   print('Error uploading file: $e');
    // }
  }
   List<Course> courses = [Course("Tp1", 'https://issatso.rnu.tn/bo/storage/app/public/courses/wJRcpOIKFtumAQxoNNfAzJWMqd8ymW3npeBoM9eB.pdf', "25/01/2024"), Course("TP2", 'https://issatso.rnu.tn/bo/storage/app/public/courses/HTZCpIQeP0FcuAe18rwveFHYHeHl0QO60kt8GwjK.pdf', "01/01/2024"), Course("DS", 'https://issatso.rnu.tn/bo/storage/app/public/courses/8tq79bAwT5pLOd4kJFW0kH8BGzL7yjVnVE67INgs.pdf', "22/03/2024")];

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
      floatingActionButton: FloatingActionButton(onPressed: (){
        _getImage();
      },
      child: Icon(Icons.upload_file,
      color: Color(0xFF6190BA),
      ),
      ),
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Column(
        children: [
          SizedBox(height: 7,),
          
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
