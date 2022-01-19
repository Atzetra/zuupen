import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:zuupen/firebase_options.dart';
import 'package:zuupen/views/end_screen.dart';
import 'package:zuupen/views/feedback_screen.dart';
import 'package:zuupen/views/game_screen.dart';

import 'bindings/launch_bindings.dart';
import 'theme/app_theme.dart';
import 'views/launch_screen.dart';
import 'views/pack_selection.dart';
import 'views/player_entry.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

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
        GetPage(
            name: PackSelection.id,
            binding: PacksBindings(),
            page: () => const PackSelection()),
        GetPage(
            name: GameScreen.id,
            binding: GameScreenBindings(),
            page: () => const GameScreen()),
        GetPage(name: EndScreen.id, page: () => const EndScreen()),
        GetPage(
            name: FeedbackScreen.id,
            binding: FeedbackBindings(),
            page: () => const FeedbackScreen()),
      ],
    );
  }
}
