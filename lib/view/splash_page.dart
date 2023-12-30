import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/splash_controller.dart';
import '../resources/strings.dart';




class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});
  

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final splashController = ref.watch(splashControllerProvider);
    splashController.performDelayedAction(context);
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: 1.0,
                  child: Image.asset(
                    'assets/images/splashImage.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
                Text(Strings.welCome,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(height: size.height*0.05),
                const CircularProgressIndicator()
              ],
            ),
          ),
        )
    );
  }
}
