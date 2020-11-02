import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future<List<Message>> browse() async {
    http.Response response = await http
        .get('https://run.mocky.io/v3/cf90d6b8-9780-408d-9347-b8d29c96b5d5');

    String content = response.body;

    List collectionDataFromJson = json.decode(content);

    List<Message> _messages =
        collectionDataFromJson.map((json) => (Message.fromJson(json))).toList();

    return _messages;
  }
}
