import 'package:flutter/material.dart';
import 'MessagesList.dart';

main(List<String> args) {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email app',
      theme: ThemeData(primarySwatch: Colors.blueGrey, accentColor: Colors.red),
      home: MessagesList(
        title: 'Hello Email App',
      ),
    );
  }
}
