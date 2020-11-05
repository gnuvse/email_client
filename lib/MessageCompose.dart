import 'package:email_clinet/Message.dart';
import 'package:flutter/material.dart';

class MessageCompose extends StatefulWidget {
  MessageCompose({Key key}) : super(key: key);

  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to;
  String subject;
  String body;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose new Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              ListTile(
                title: TextFormField(
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(
                    labelText: 'TO',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(
                    labelText: 'SUBJECT',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Colors.red,
              ),
              ListTile(
                title: TextFormField(
                  onSaved: (value) => body = value,
                  decoration: InputDecoration(
                    labelText: 'BODY',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  maxLines: 10,
                ),
              ),
              ListTile(
                title: RaisedButton(
                  color: Colors.red[300],
                  child: Text('SEND'),
                  onPressed: () {
                    this.key.currentState.save();
                    Message message = Message(subject, body);
                    Navigator.pop(context, message);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
