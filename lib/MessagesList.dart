import 'package:email_clinet/ComposeButton.dart';
import 'package:email_clinet/Message.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'MesageDeatail.dart';

class MessagesList extends StatefulWidget {
  final String title;
  const MessagesList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  Future<List<Message>> future;
  List<Message> messages = [];
  var messageLen;

  initState() {
    super.initState();
    fetch();
    messageLen = messages.length;
  }

  // void updateList(List<Message> messages) =>

  void fetch() async {
    future = Message.browse();
    messages = await future;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh_sharp),
              onPressed: () async {
                future = Message.browse();
                var _messages = await future;
                setState(() {
                  messages = _messages;
                });
              })
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError)
                return Text("There was an error: ${snapshot.error}");
              var messages = snapshot.data;
              messageLen = messages.length;

              return ListView.separated(
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MessageDeatail(message.subject, message.body),
                        ),
                      );
                    },
                  );
                },
              );
          }
        },
      ),
      floatingActionButton: ComposeButton(future),
    );
  }
}
