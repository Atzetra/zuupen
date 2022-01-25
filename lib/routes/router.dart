import 'package:auto_route/auto_route.dart';
import 'package:zuupen/views/end_screen.dart';
import 'package:zuupen/views/feedback_screen.dart';
import 'package:zuupen/views/game_screen.dart';
import 'package:zuupen/views/launch_screen.dart';
import 'package:zuupen/views/pack_selection_screen.dart';
import 'package:zuupen/views/player_entry_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LaunchScreen, initial: true),
    AutoRoute(page: PlayerEntryScreen),
    AutoRoute(page: PackSelectionScreen),
    AutoRoute(page: GameScreen),
    AutoRoute(page: FeedbackScreen),
    AutoRoute(page: EndScreen),
  ],
)
class $AppRouter {}
