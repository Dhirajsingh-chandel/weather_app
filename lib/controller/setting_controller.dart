import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final darkModeProvider = StateNotifierProvider<DarkModeController, bool>((ref) {
  return DarkModeController();
});


class DarkModeController extends StateNotifier<bool> {
  DarkModeController() : super(false);


  void toggleDarkMode() {
    state = !state;
  }
}