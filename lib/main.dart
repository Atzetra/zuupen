import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/launch_bindings.dart';
import 'theme/app_theme.dart';
import 'views/launch_screen.dart';
import 'views/pack_selection.dart';
import 'views/player_entry.dart';

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
