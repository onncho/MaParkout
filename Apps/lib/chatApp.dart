import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  //modified
  @override //new
  State createState() => new ChatScreenState(); //new
}

// Add the ChatScreenState class definition in main.dart.
class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController =
      new TextEditingController(); //new
  @override //new
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: _buildTextComposer(),
    );
  }

  //private method
  Widget _buildTextComposer() {
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        //new
        children: <Widget>[
          //new
          new Flexible(
            //new
            child: new TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  new InputDecoration.collapsed(hintText: "Send a message"),
            ),
          ), //new
        ], //new
      ), //new
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}
