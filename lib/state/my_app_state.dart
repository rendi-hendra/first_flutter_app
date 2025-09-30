import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MyAppState extends ChangeNotifier {
  var pageCount = 0;
  var currentGroup = 0;
  List<dynamic> selectChat = [];

  final chatBox = Hive.box('chat');

  final List<Map<String, dynamic>> listChat = [
    {
      'title': 'Rendi',
      'lastChat': 'Hello',
      'date': '10.30',
      'notification': '50',
    },
    {
      'title': 'Fufufafa',
      'lastChat': 'fufufuuffu',
      'date': 'Today',
      'notification': null,
    },
  ];

  List getAllUsers() {
    final data = chatBox.keys.map((key) {
      final value = chatBox.get(key);
      return {
        "key": key,
        "title": value["title"],
        "lastChat": value['lastChat'],
        "date": value["date"],
        "notification": value["notification"],
      };
    }).toList();

    return data.reversed.toList();
  }

  void getUser(int index) async {
    print(chatBox.values);
    notifyListeners();
  }

  void addChatAll(List<Map<String, dynamic>> chat) {
    chatBox.addAll(chat);
    notifyListeners();
  }

  void removeChat(int index) {
    final List<Map<String, dynamic>> currentChats = listChat;
    currentChats.removeAt(index);
    chatBox.put('chat', currentChats);
    notifyListeners();
  }

  void removeAllChat() {
    if (chatBox.isNotEmpty) {
      chatBox.deleteFromDisk();
      notifyListeners();
    }
  }

  void setPageCount(int newCount) {
    pageCount = newCount;
    notifyListeners();
  }

  void setCurrentGroup(int currentGroup) {
    this.currentGroup = currentGroup;
    notifyListeners();
  }

  void setSelectChat(dynamic index) {
    // selectChat = index;
    if (selectChat.contains(index)) {
      var selectIndex = selectChat.indexOf(index);
      selectChat.removeAt(selectIndex);
      notifyListeners();
    } else {
      selectChat.add(index);
      notifyListeners();
    }
  }

  void setListChat(
    String title,
    String? lastChat,
    String? date,
    String? notification,
  ) {
    listChat.add({
      'title': title,
      'lastChat': lastChat,
      'date': date,
      'notification': notification,
    });
    notifyListeners();
  }
}
