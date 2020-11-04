import 'package:flutter/material.dart';

import 'MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  const ComposeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MessageCompose()));
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Your message has been sent wish $intention",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.grey,
          ),
        );
      },
    );
  }
}
