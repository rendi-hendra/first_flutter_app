import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var pageCount = 0;

  void setPageCount(int newCount) {
    pageCount = newCount;
    notifyListeners();
  }
}
