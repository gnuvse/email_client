import 'dart:convert';

import 'package:email_clinet/Message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessagesList extends StatefulWidget {
  final String title;
  const MessagesList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  List<Message> messages = const [];

  Future loadMessagesList() async {
    http.Response response = await http
        .get('https://run.mocky.io/v3/cf90d6b8-9780-408d-9347-b8d29c96b5d5');

    String content = response.body;

    List collectionDataFromJson = json.decode(content);

    List<Message> _messages =
        collectionDataFromJson.map((json) => (Message.fromJson(json))).toList();

    setState(() {
      messages = _messages;
    });
  }

  @override
  void initState() {
    loadMessagesList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          Message message = messages[index];

          return ListTile(
            title: Text(message.subject),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text("PJ"),
              backgroundColor: Colors.red[500],
              foregroundColor: Colors.black,
            ),
            subtitle: Text(
              message.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}
