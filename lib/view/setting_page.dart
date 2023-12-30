import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/setting_controller.dart';
import '../resources/strings.dart';



class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeController = ref.read(darkModeProvider.notifier);
    final isDarkMode = ref.watch(darkModeProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.appSettings,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              ListTile(
                leading: isDarkMode
                    ? const Icon(
                        Icons.dark_mode,
                        color: Colors.amber,
                      )
                    : const Icon(
                        Icons.light_mode,
                        color: Colors.amber,
                      ),
                title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode'),
                subtitle:
                    Text(isDarkMode ? 'Enable dark mode' : 'Enable Light Mode'),
                //const Text('Enable dark mode'),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (_) {
                    darkModeController.toggleDarkMode();
                  },
                ),
              ),
              // Add more ListTiles or settings here if needed
            ],
          ),
        ),
      ),
    );
  }
}
