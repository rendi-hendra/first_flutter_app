import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// class HiveFunctions {
//   // Box which will use to store the things
//   static final userBox = Hive.box('chat');

//   // Create or add single data in hive
//   static void createUser(Map data) {
//     userBox.add(data);
//   }

//   // Create or add multiple data in hive
//   static void addAllUser(List data) {
//     userBox.addAll(data);
//   }

//   // Get All data  stored in hive
//   static List getAllUsers() {
//     final data = userBox.keys.map((key) {
//       final value = userBox.get(key);
//       return {"key": key, "name": value["name"], "message": value['message']};
//     }).toList();

//     return data.reversed.toList();
//   }

//   // Get data for particular user in hive
//   static Map getUser(int key) {
//     return userBox.get(key);
//   }

//   // update data for particular user in hive
//   static void updateUser(int key, Map data) {
//     userBox.put(key, data);
//   }

//   // delete data for particular user in hive
//   static Future<void> deleteUser(int key) {
//     return userBox.delete(key);
//   }

//   // delete data for particular user in hive
//   static Future<void> deleteAllUser(int key) {
//     return userBox.deleteAll(userBox.keys);
//   }
// }

class MyAppState extends ChangeNotifier {
  var pageCount = 0;
  var currentGroup = 0;
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

  // List<Map<String, dynamic>> get chats {
  //   return List<Map<String, dynamic>>.from(
  //     _box.get('chatList', defaultValue: []),
  //   );
  // }

  // Tambah chat baru
  void addChatAll(List<Map<String, dynamic>> chat) {
    // final List<Map<String, dynamic>> currentChats = chats;
    // currentChats.add(chat);
    // _box.put('chatList', currentChats);
    chatBox.addAll(chat);
    notifyListeners();
  }

  // // Hapus chat berdasarkan index
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

  void setListChat(
    String title,
    String? lastChat,
    String? date,
    String? notification,
  ) {
    // final <Map<String, dynamic>> words = [
    //   {'title': 'Wowo', 'lastChat': 'Gas', 'date': 'Yesterday'},
    // ];
    // listChat.asMap();
    listChat.add({
      'title': title,
      'lastChat': lastChat,
      'date': date,
      'notification': notification,
    });
    notifyListeners();
  }
}
