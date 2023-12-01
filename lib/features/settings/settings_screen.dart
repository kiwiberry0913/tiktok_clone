import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

// when using ConsumerWidget we should add WidgetRef ref to out build parameters
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            title: const Text("Mute"),
            subtitle: const Text("Videos will be muted by default"),
            activeColor: Theme.of(context).primaryColor,
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setMuted(value),
          ),
          SwitchListTile.adaptive(
            title: const Text("Autoplay"),
            subtitle: const Text("Videos will autoplay by default"),
            activeColor: Theme.of(context).primaryColor,
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) =>
                ref.read(playbackConfigProvider.notifier).setAutoplay(value),
          ),
          SwitchListTile.adaptive(
            title: const Text("Enable notifications"),
            subtitle: const Text("Don't worry, they will be cute"),
            activeColor: Theme.of(context).primaryColor,
            value: false,
            onChanged: (value) {},
          ),
          SwitchListTile.adaptive(
            title: const Text("Marketing emails"),
            subtitle: const Text("We won't spam you"),
            activeColor: Theme.of(context).primaryColor,
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              if (kDebugMode) {
                print(date);
              }
              // ignore: use_build_context_synchronously
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (kDebugMode) {
                print(time);
              }
              // ignore: use_build_context_synchronously
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                      data: ThemeData(
                        appBarTheme: const AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      child: child!);
                },
              );
              if (kDebugMode) {
                print(booking);
              }
            },
            title: const Text("When is your birthday?"),
            subtitle: const Text("I need to know!"),
          ),
          ListTile(
            title: const Text(
              "Logout iOS",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Please don't go..."),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        "No",
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      isDestructiveAction: true,
                      child: const Text(
                        "Yes",
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Logout iOS / bottom bar"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  message: const Text("Please don't gooooooooooo..."),
                  actions: [
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Don't logout"),
                    ),
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () => ref.read(authRepo).signOut(),
                      child: const Text("Yes"),
                    ),
                  ],
                ),
              );
            },
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
