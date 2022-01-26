import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zuupen/controllers/database_provider.dart';
import 'package:zuupen/controllers/packs_controller.dart';
import 'package:zuupen/controllers/player_controller.dart';

import '../constants/extensions/string_extensions.dart';
import '../enums/enums.dart';
import '../models/gamecard.dart';

final cardsProvider =
    ChangeNotifierProvider<CardsController>((ref) => CardsController(ref));

class CardsController with ChangeNotifier {
  CardsController(this.ref);
  // Load in needed controllers for this class
  final Ref ref;
  final _cards = <GameCard>[];
  final _pickBuffer = <GameCard>[];
  final _finalCards = <GameCard>[];
  List<GameCard> get finalCards => _finalCards;
  final _ruleCards = <GameCard>[];
  final _virusCards = <GameCard>[];
  final _bottomsUpCards = <GameCard>[];
  final _gameCards = <GameCard>[];
  final _calienteCards = <GameCard>[];
  final _dualCards = <GameCard>[];
  final _names = <String>[];

  void onInit() {
    cardSeparator();
    cardSelector();
    cardPopulator();
    // for (var _card in _finalCards) {
    //   print(_card.firstLine);
    // }
  }

  void cardPopulator() {
    final _players = ref.watch(playerProvider);
    // Get around the FUCKING annoying thing that shallow object copy isn't a
    // thing in Dart. Praise the Freezed package, may blessings be upon him

    // Add names
    for (var _player in _players) {
      _names.add(_player.name);
    }

    // Get names into the decks
    for (var _card in _cards) {
      String _firstLine;
      _firstLine = ruleParser(_card.firstLine, _card.players, _card.elements);
      _firstLine = _firstLine.capitalizer();
      _finalCards.add(_card.copyWith(firstLine: _firstLine));
    }
  }

  void cardSeparator() {
    final _toggledPacks = ref.watch(toggledPacksProvider);
    final _databaseCards = ref.watch(databaseProvider);
    final _players = ref.watch(playerProvider);
    final _selectedPack = _toggledPacks.keys.firstWhere((element) => true);

    _pickBuffer.addAll(_databaseCards[_selectedPack]!);
    // Add all selected decks to card pile
    _pickBuffer.removeWhere((element) => element.players > _players.length);

    for (var _card in _pickBuffer) {
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
        case CardType.caliente:
          _calienteCards.add(_card);
          break;
        case CardType.dual:
          _dualCards.add(_card);
          break;
        default:
          break;
      }
    }
  }

  void cardSelector() {
    // 40
    _cards.addAll((_ruleCards.toList()..shuffle()).take(40));
    // 6
    _cards.addAll((_gameCards.toList()..shuffle()).take(6));
    // 2
    _cards.addAll((_bottomsUpCards.toList()..shuffle()).take(2));
    // 3
    _cards.addAll((_calienteCards.toList()..shuffle()).take(3));

    _cards.shuffle();

    // 5
    _virusPlacer(
      (_virusCards.toList()..shuffle()).take(5).toList(),
    );
    // 4
    _dualCardPlacer((_dualCards.toList()..shuffle()).take(4).toList());
  }

  void _dualCardPlacer(List<GameCard> _dualCards) {
    final _random = Random();
    for (var _card in _dualCards) {
      final _insertIndex = _random.nextInt(_cards.length - 1);
      final _secondCard = GameCard(
          firstLine: _card.secondLine!,
          cardType: CardType.dual,
          players: 0,
          elements: 0);
      _cards
        ..insert(_insertIndex, _card)
        ..insert(_insertIndex + 1, _secondCard);
    }
  }

  void _virusPlacer(List<GameCard> _virusses) {
    final _random = Random();
    for (var _card in _virusses) {
      final _firstInsertIndex = _random.nextInt(_cards.length - 1);
      final _secondInsertIndex = _firstInsertIndex +
          1 +
          _random.nextInt(_cards.length - _firstInsertIndex);
      final _virusEnd = GameCard(
          firstLine: _card.secondLine!,
          cardType: CardType.virus,
          players: 0,
          elements: 0);
      _cards
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
      final _shuffledistribution = [
        1,
        1,
        1,
        2,
        2,
        2,
        2,
        2,
        3,
        3,
        3,
        3,
        3,
        4,
        4,
        4,
        5,
        5,
        6,
      ];
      int sips = (_shuffledistribution.toList()..shuffle())
          .elementAt(_rng.nextInt(_shuffledistribution.length));
      print(sips);
      _rule = _rule.replaceAll("{[$i]}", sips.toString());
//       print(rule);
      if (sips != 1) {
        _rule = _rule.replaceAll("$sips time", "$sips times");
        _rule = _rule.replaceAll("$sips drink", "$sips drinks");
        _rule = _rule.replaceAll("$sips sip", "$sips sips");
      }
    }
    return _rule;
  }
}
