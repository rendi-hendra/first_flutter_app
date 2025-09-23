import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class User {
  String name;
  String massage;
  User(this.name, this.massage);

  User.formJson(Map<String, dynamic> json)
    : name = json['name'],
      massage = json['massage'];

  Map<String, dynamic> toJson() => {'name': name, 'massage': massage};
}

class MyAppState extends ChangeNotifier {
  final List<String> _name = [];
  final List<String> _messages = [];

  List<String> get name => _name;
  List<String> get messages => _messages;
  void setName(String newName) {
    _name.add(newName);
    notifyListeners();
  }

  void setMessages(String newMessage) {
    _messages.add(newMessage);
    notifyListeners();
  }

  void clear() {
    _name.clear();
    _messages.clear();
    notifyListeners();
  }
}
