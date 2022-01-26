// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../views/end_screen.dart' as _i6;
import '../views/feedback_screen.dart' as _i5;
import '../views/game_screen.dart' as _i4;
import '../views/launch_screen.dart' as _i1;
import '../views/pack_selection_screen.dart' as _i3;
import '../views/player_entry_screen.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LaunchRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LaunchScreen());
    },
    PlayerEntryRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PlayerEntryScreen());
    },
    PackSelectionRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PackSelectionScreen());
    },
    GameRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.GameScreen());
    },
    FeedbackRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.FeedbackScreen());
    },
    EndRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EndScreen());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(LaunchRoute.name, path: '/'),
        _i7.RouteConfig(PlayerEntryRoute.name, path: '/player-entry-screen'),
        _i7.RouteConfig(PackSelectionRoute.name,
            path: '/pack-selection-screen'),
        _i7.RouteConfig(GameRoute.name, path: '/game-screen'),
        _i7.RouteConfig(FeedbackRoute.name, path: '/feedback-screen'),
        _i7.RouteConfig(EndRoute.name, path: '/end-screen')
      ];
}

/// generated route for
/// [_i1.LaunchScreen]
class LaunchRoute extends _i7.PageRouteInfo<void> {
  const LaunchRoute() : super(LaunchRoute.name, path: '/');

  static const String name = 'LaunchRoute';
}

/// generated route for
/// [_i2.PlayerEntryScreen]
class PlayerEntryRoute extends _i7.PageRouteInfo<void> {
  const PlayerEntryRoute()
      : super(PlayerEntryRoute.name, path: '/player-entry-screen');

  static const String name = 'PlayerEntryRoute';
}

/// generated route for
/// [_i3.PackSelectionScreen]
class PackSelectionRoute extends _i7.PageRouteInfo<void> {
  const PackSelectionRoute()
      : super(PackSelectionRoute.name, path: '/pack-selection-screen');

  static const String name = 'PackSelectionRoute';
}

/// generated route for
/// [_i4.GameScreen]
class GameRoute extends _i7.PageRouteInfo<void> {
  const GameRoute() : super(GameRoute.name, path: '/game-screen');

  static const String name = 'GameRoute';
}

/// generated route for
/// [_i5.FeedbackScreen]
class FeedbackRoute extends _i7.PageRouteInfo<void> {
  const FeedbackRoute() : super(FeedbackRoute.name, path: '/feedback-screen');

  static const String name = 'FeedbackRoute';
}

/// generated route for
/// [_i6.EndScreen]
class EndRoute extends _i7.PageRouteInfo<void> {
  const EndRoute() : super(EndRoute.name, path: '/end-screen');

  static const String name = 'EndRoute';
}
