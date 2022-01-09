import 'dart:math';

import 'package:get/get.dart';
import 'package:zuupen/constants/extensions/string_extensions.dart';
import 'package:zuupen/constants/packs/card_packs.dart';
import 'package:zuupen/controllers/packs_controller.dart';
import 'package:zuupen/controllers/player_controller.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/game_card.dart';

class CardsController extends GetxController {
  // Load in needed controllers for this class
  final PlayerController _playerController = Get.find<PlayerController>();
  final PacksController _packsController = Get.find<PacksController>();

  final _cards = <GameCard>[];
  final _cloneCards = <GameCard>[];
  final _ruleCards = <GameCard>[];
  final _virusCards = <GameCard>[];
  final _bottomsUpCards = <GameCard>[];
  final _gameCards = <GameCard>[];
  final _names = <String>[];

  CardsController();

  @override
  void onInit() {
    cardSelector();
    super.onInit();
  }

  void cardSelector() {
    cardPopulator();
    cardSeparator();
  }

  void cardPopulator() {
    // Add all selected decks to card pile
    for (var _pack in _packsController.selectedPacks) {
      _cards.addAll(allPacks[_pack]!);
    }

    // Get around the FUCKING annoying thing that shallow object copy isn't a
    // thing in Dart.
    for (var _element in _cards) {
      _cloneCards.add(_element.clone());
    }

    // Add names
    for (var _player in _playerController.players) {
      _names.add(_player.name);
    }

    // Get names into the decks
    for (GameCard _card in _cloneCards) {
      _card.firstLine =
          ruleParser(_card.firstLine, _card.players, _card.elements);
      _card.firstLine = _card.firstLine.capitalizer();
    }
  }

  void cardSeparator() {
    for (var _card in _cloneCards) {
      switch (_card.cardType) {
        case CardType.rule:
          _ruleCards.add(_card);
          break;
        case CardType.game:
          _gameCards.add(_card);
          break;
        case CardType.virus:
          _virusCards.add(_card);
          break;
        case CardType.bottomsUp:
          _bottomsUpCards.add(_card);
          break;
        default:
          break;
      }
    }
    print('--------------------Rulecards-------------------------');
    _ruleCards.forEach((element) {
      print(element.firstLine);
    });
    print('---------------------Bottoms----------------------------');
    _bottomsUpCards.forEach((element) {
      print(element.firstLine);
    });
    print(
        '--------------------------Gamecard----------------------------------');
    _gameCards.forEach((element) {
      print(element.firstLine);
    });
    print(
        '----------------------------------Virus--------------------------------------');
    _virusCards.forEach((element) {
      print(element.firstLine);
    });
  }

  //String parser
  String ruleParser(String _rule, int _players, int _elements) {
    _rule = nameReplace(_rule, _players);
    _rule = takeDecider(_rule);
    _rule = sipDecider(_rule, _elements);
    return _rule;
  }

  // Replaces '{{}}' fields with names.
  String nameReplace(String _rule, int _players) {
    final Random _random = Random();
    // Reminder for self: using '=' for lists doesn't work...
    List<String> _replaceNames = [..._names];
    String _name;

    for (var i = 0; i < _players; i++) {
      int choice = _random.nextInt(_replaceNames.length);

      _name = _replaceNames[choice];
      _replaceNames.removeAt(choice);
      _rule = _rule.replaceAll("{{$i}}", _name);
    }
    return _rule;
  }

  String takeDecider(String _rule) {
    final List<String> choice = [
      "drink {[0]} time",
      "give out {[0]} drink",
    ];
    Random _rng = Random();
    // Detrimine if to drink or to give out.
    _rule = _rule.replaceAll("{{drink}}", choice[_rng.nextInt(choice.length)]);
    return _rule;
  }

  String sipDecider(String _rule, int _elements) {
    Random _rng = Random();

    for (var i = 0; i < _elements; i++) {
      // Random sips between 1 and 5, 6 is exclusive.
      int sips = 1 + _rng.nextInt(6);
      _rule = _rule.replaceAll("{[$i]}", sips.toString());
//       print(rule);
      if (sips != 1) {
        _rule = _rule.replaceAll("$sips time", "$sips times");
        _rule = _rule.replaceAll("$sips drink", "$sips drinks");
      }
    }
    return _rule;
  }
}
