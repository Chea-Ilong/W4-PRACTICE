import 'package:flutter/material.dart';

class ColorService extends ChangeNotifier{
  
  int redTapCount = 0;
  int blueTapCount = 0;

  void incrementRedTapCount() {
    redTapCount++;
    notifyListeners();
  }

  void incrementBlueTapCount() {
    blueTapCount++;
    notifyListeners();
  }
}