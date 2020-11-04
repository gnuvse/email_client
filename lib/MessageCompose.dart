import 'package:flutter/material.dart';

class MessageCompose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose new Message"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Compose New Message",
                style: Theme.of(context).textTheme.headline6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text("Love"),
                  onPressed: () {
                    Navigator.pop(context, "Love");
                  },
                ),
                RaisedButton(
                  child: Text("Hate"),
                  onPressed: () {
                    Navigator.pop(context, "Hate");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
