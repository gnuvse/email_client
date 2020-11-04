import 'package:flutter/material.dart';

class MessageDeatail extends StatelessWidget {
  final String subject;
  final String body;

  MessageDeatail(this.subject, this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Container(
        child: Text(this.body),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
