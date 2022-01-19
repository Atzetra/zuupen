import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/cards_controller.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/game_card.dart';
import 'package:zuupen/views/end_screen.dart';
import 'package:zuupen/views/launch_screen.dart';

class GameController extends GetxController {
  final CardsController _cardsController = Get.find();

  final _index = 0.obs;
  final _gameCards = <GameCard>[].obs;
  get nextCard => _nextCard;
  GameCard get showCard => _showCard();
  get backHandler => _backHandler;
  String get cardText => _gameCards[_index.value].firstLine;
  Color get cardColor => _showColor();
  String get categoryText => _showCategory();

  @override
  void onInit() {
    populate();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.onInit();
  }

  @override
  void onClose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.onClose();
  }

  void populate() {
    _gameCards.addAll(_cardsController.finalCards);
  }

  Future<bool> _backHandler() async {
    bool _action = false;
    await Get.dialog(
      AlertDialog(
        title: const Text('End Game?'),
        content: const Text('Do you want to exit and end this game?'),
        actions: [
          TextButton(
            onPressed: () {
              _action = false;
              Get.back(result: false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              _action = true;
              Get.offAllNamed(LaunchScreen.id);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
    return _action;
  }

  void _nextCard() {
    if (_index.value != _gameCards.length - 1) {
      _index.value++;
      update();
    } else {
      Get.offAllNamed(EndScreen.id);
    }
  }

  GameCard _showCard() {
    return _gameCards[_index.value];
  }

  Color _showColor() {
    switch (_gameCards[_index.value].cardType) {
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
    switch (_gameCards[_index.value].cardType) {
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
