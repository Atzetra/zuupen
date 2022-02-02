import 'package:auto_route/auto_route.dart';

import '../views/end_screen.dart';
import '../views/feedback_screen.dart';
import '../views/game_screen.dart';
import '../views/launch_screen.dart';
import '../views/pack_selection_screen.dart';
import '../views/player_entry_screen.dart';

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
