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
  final _pickBuffer = <GameCard>[];
  final _finalCards = <GameCard>[];
  List<GameCard> get finalCards => _finalCards;
  final _ruleCards = <GameCard>[];
  final _virusCards = <GameCard>[];
  final _bottomsUpCards = <GameCard>[];
  final _gameCards = <GameCard>[];
  final _names = <String>[];

  CardsController();

  @override
  void onInit() {
    cardSeparator();
    cardSelector();
    cardPopulator();
    // for (var _card in _finalCards) {
    //   print(_card.firstLine);
    // }
    super.onInit();
  }

  void cardPopulator() {
    // Get around the FUCKING annoying thing that shallow object copy isn't a
    // thing in Dart.
    for (var _card in _pickBuffer) {
      _finalCards.add(_card.clone());
    }

    // Add names
    for (var _player in _playerController.players) {
      _names.add(_player.name);
    }

    // Get names into the decks
    for (var _card in _finalCards) {
      _card.firstLine =
          ruleParser(_card.firstLine, _card.players, _card.elements);
      _card.firstLine = _card.firstLine.capitalizer();
    }
  }

  void cardSeparator() {
    // Add all selected decks to card pile
    for (var _pack in _packsController.selectedPacks) {
      _cards.addAll(allPacks[_pack]!);
      _cards.removeWhere(
          (element) => element.players > _playerController.players.length);
    }

    for (var _card in _cards) {
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

    // print('--------------------Rulecards-------------------------');
    // print(_ruleCards.length);
    // _ruleCards.forEach((element) {
    //   print(element.firstLine);
    // });
    // print('---------------------Bottoms----------------------------');
    // print(_bottomsUpCards.length);
    // _bottomsUpCards.forEach((element) {
    //   print(element.firstLine);
    // });
    // print(
    //     '--------------------------Gamecard----------------------------------');
    // print(_gameCards.length);
    // _gameCards.forEach((element) {
    //   print(element.firstLine);
    // });
    // print(
    //     '----------------------------------Virus--------------------------------------');
    // print(_virusCards.length);
    // _virusCards.forEach((element) {
    //   print(element.firstLine);
    // });
  }

  void cardSelector() {
    print('_pickBuffer before cardSelector: ' + _pickBuffer.length.toString());
    // 40
    _pickBuffer.addAll((_ruleCards.toList()..shuffle()).take(41));

// 6
    _pickBuffer.addAll((_gameCards.toList()..shuffle()).take(6));

// 2
    _pickBuffer.addAll((_bottomsUpCards.toList()..shuffle()).take(2));

    _pickBuffer.shuffle();

// 5
    _virusPlacer(
      (_virusCards.toList()..shuffle()).take(5).toList(),
    );
  }

  void _virusPlacer(List<GameCard> _virusses) {
    final _random = Random();
    for (var _card in _virusses) {
      final _firstInsertIndex = _random.nextInt(_pickBuffer.length - 1);
      final _secondInsertIndex = _firstInsertIndex +
          1 +
          _random.nextInt(_pickBuffer.length - _firstInsertIndex);
      final _virusEnd = GameCard(
          firstLine: _card.secondLine!,
          cardType: CardType.virus,
          players: 0,
          elements: 0);
      _pickBuffer
        ..insert(_firstInsertIndex, _card)
        ..insert(_secondInsertIndex, _virusEnd);
    }
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
