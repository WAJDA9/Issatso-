import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = "AIzaSyDbxl3dIcwD97JLPcwipTPuYSy6FhHth-o";
var prompts = ["Hello"];
var responses = ["Hi"];

class Chat extends StatefulWidget {
  const Chat({super.key});
  Future test() async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    final content = [Content.text(prompts[prompts.length - 1])];
    final response = await model.generateContent(content);
    responses.add(response.text.toString());
    return 1;
  }

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var _cont = TextEditingController();

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
              child: Text(prompts[i]),
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
            child: TextField(
              controller: _cont,
              decoration: InputDecoration(
                suffixIcon: prompts.length <= responses.length ? IconButton(
                  icon: Icon(Icons.send),
                  onPressed:  () async {
                    setState(() {
                      prompts.add(_cont.text);
                      
                      _cont.clear();
                    });
                     await widget.test(); 
                    setState(() {
                      
                    });
                  },
                )
                :Icon(Icons.pause)
                ,
                border: OutlineInputBorder(),
                labelText: 'Type your message here',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
