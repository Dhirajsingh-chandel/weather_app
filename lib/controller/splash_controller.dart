import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view/home.dart';

final splashControllerProvider = Provider<SplashController>((ref) {
  return SplashController();
});

class SplashController  extends ChangeNotifier{

  Future<void> performDelayedAction(context) async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      // Perform the action after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    } catch (e) {
      // Handle any potential errors that might occur during the delayed action
      if (kDebugMode) {
        print('Error during delayed splash page: $e');
      }
    }
  }
}
