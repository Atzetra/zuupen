import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/bindings/launch_bindings.dart';
import 'package:zuupen/theme/app_theme.dart';
import 'package:zuupen/views/launch_screen.dart';
import 'package:zuupen/views/pack_selection.dart';
import 'package:zuupen/views/player_entry.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zuupen',
      theme: AppTheme.themeData(context),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: LaunchScreen.id,
      getPages: [
        GetPage(name: LaunchScreen.id, page: () => const LaunchScreen()),
        GetPage(
            name: PlayerEntry.id,
            binding: PlayersBindings(),
            page: () => const PlayerEntry()),
        GetPage(name: PackSelection.id, page: () => const PackSelection()),
      ],
    );
  }
}
