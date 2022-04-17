import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enums/enums.dart';
import '../models/gamecard.dart';
import '../routes/router.gr.dart';
import 'cards_controller.dart';

final gameProvider = ChangeNotifierProvider<GameController>((ref) {
  return GameController(ref);
});

// TODO: Convert to statenotifier
class GameController extends ChangeNotifier {
  final Ref ref;
  var _index = 0;
  final _gameCards = <GameCard>[];

  GameController(this.ref);
  GameCard get showCard => _showCard();
  String get cardText => _gameCards[_index].firstLine;
  Color get cardColor => _showColor();
  String get categoryText => _showCategory();

  void onInit() {
    populate();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  void populate() {
    final _cards = ref.watch(cardsProvider);
    _gameCards.addAll(_cards.finalCards);
  }

  void nextCard(BuildContext context) {
    if (_index != _gameCards.length - 1) {
      _index++;
      notifyListeners();
    } else {
      AutoRouter.of(context).replace(const EndRoute());
    }
  }

  GameCard _showCard() {
    return _gameCards[_index];
  }

  Color _showColor() {
    switch (_gameCards[_index].cardType) {
      case CardType.rule:
        return Colors.green;
      case CardType.bottomsUp:
        return Colors.black;
      case CardType.virus:
        return Colors.deepOrange;
      case CardType.game:
        return Colors.green;
      case CardType.caliente:
        return Colors.pink;
      default:
        return Colors.green;
    }
  }

  String _showCategory() {
    switch (_gameCards[_index].cardType) {
      case CardType.rule:
        return 'Rule';
      case CardType.bottomsUp:
        return 'Bottoms Up';
      case CardType.virus:
        return 'Virus';
      case CardType.game:
        return 'Game';
      case CardType.caliente:
        return 'Caliente';
      default:
        return 'Rule';
    }
  }
}

Future<bool> backHandler(BuildContext context) async {
  bool _action = false;
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('End Game?'),
          content: const Text('Do you want to exit and end this game?'),
          actions: [
            TextButton(
              onPressed: () {
                _action = false;
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _action = true;
                AutoRouter.of(context).navigate(const PlayerEntryRoute());
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
  return _action;
}
