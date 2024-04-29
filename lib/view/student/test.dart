import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

void run(){
  runApp(ChatS());
}

const apiKey = "AIzaSyDbxl3dIcwD97JLPcwipTPuYSy6FhHth-o";
var prompts = ["Hello"];
var responses = ["Hi"];
final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

class ChatS extends StatefulWidget {
  const ChatS({Key? key});

  @override
  State<ChatS> createState() => _ChatState();
}

class _ChatState extends State<ChatS> {
  var _cont = TextEditingController();
  File? _image;

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _sendMessage() {
    if (_cont.text.isNotEmpty) {
      prompts.add(_cont.text);
      _cont.clear();
      final content = Content.text(prompts.last);
      model.generateContent([content]).then((response) {
        responses.add(response.text.toString());
        setState(() {
          _image = null;
        });
      });
    }
  }

  void _sendImage() {
    if (_image != null) {
      final content = Content.multi([
        TextPart(prompts.last),
        DataPart("image/png", _image!.readAsBytesSync())
      ]);
      model.generateContent([content]).then((response) {
        responses.add(response.text.toString());
        setState(() {
          _image = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chatWidgets = [];

    for (int i = 0; i < prompts.length || i < responses.length; i++) {
      if (i < prompts.length) {
        chatWidgets.add(
          Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.fromLTRB(100, 5, 10, 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF6190BA),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_image != null) Image.file(_image!),
                  Text(prompts[i]),
                ],
              ),
            ),
          ),
        );
      }
      if (i < responses.length) {
        chatWidgets.add(
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(10, 5, 100, 5),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Text(responses[i]),
            ),
          ),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Text("Ask Me Anything"),
          Expanded(
            child: ListView(
              children: chatWidgets,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _cont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type your message here',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _getImage,
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('Send Text'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendImage,
                  child: Text('Send Image'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
