import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/extensions/string_extensions.dart';
import '../enums/enums.dart';
import '../models/gamecard.dart';
import 'database_provider.dart';
import 'packs_controller.dart';
import 'player_controller.dart';

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
    final players = ref.watch(playerProvider);
    // Get around the FUCKING annoying thing that shallow object copy isn't a
    // thing in Dart. Praise the Freezed package, may blessings be upon him

    // Add names
    for (var player in players) {
      _names.add(player.name);
    }

    // Get names into the decks
    for (var card in _cards) {
      String firstLine;
      firstLine = ruleParser(card.firstLine, card.players, card.elements);
      firstLine = firstLine.capitalizer();
      _finalCards.add(card.copyWith(firstLine: firstLine));
    }
  }

  void cardSeparator() {
    final toggledPacks = ref.watch(toggledPacksProvider);
    final databaseCards = ref.watch(databaseProvider);
    final players = ref.watch(playerProvider);
    final selectedPack = toggledPacks.keys.firstWhere((element) => true);

    _pickBuffer.addAll(databaseCards[selectedPack]!);
    // Add all selected decks to card pile
    _pickBuffer.removeWhere((element) => element.players > players.length);

    for (var card in _pickBuffer) {
      switch (card.cardType) {
        case CardType.rule:
          _ruleCards.add(card);
          break;
        case CardType.game:
          _gameCards.add(card);
          break;
        case CardType.virus:
          _virusCards.add(card);
          break;
        case CardType.bottomsUp:
          _bottomsUpCards.add(card);
          break;
        case CardType.caliente:
          _calienteCards.add(card);
          break;
        case CardType.dual:
          _dualCards.add(card);
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

  void _dualCardPlacer(List<GameCard> dualCards) {
    final random = Random();
    for (var card in dualCards) {
      final insertIndex = random.nextInt(_cards.length - 1);
      final secondCard = GameCard(
          firstLine: card.secondLine!,
          cardType: CardType.dual,
          players: 0,
          elements: 0);
      _cards
        ..insert(insertIndex, card)
        ..insert(insertIndex + 1, secondCard);
    }
  }

  void _virusPlacer(List<GameCard> virusses) {
    final random = Random();
    for (var card in virusses) {
      final firstInsertIndex = random.nextInt(_cards.length - 1);
      final secondInsertIndex = firstInsertIndex +
          1 +
          random.nextInt(_cards.length - firstInsertIndex);
      final virusEnd = GameCard(
          firstLine: card.secondLine!,
          cardType: CardType.virus,
          players: 0,
          elements: 0);
      _cards
        ..insert(firstInsertIndex, card)
        ..insert(secondInsertIndex, virusEnd);
    }
  }

  //String parser
  String ruleParser(String rule, int players, int elements) {
    rule = nameReplace(rule, players);
    rule = takeDecider(rule);
    rule = sipDecider(rule, elements);
    return rule;
  }

  // Replaces '{{}}' fields with names.
  String nameReplace(String rule, int players) {
    final Random random = Random();
    // Reminder for self: using '=' for lists doesn't work...
    List<String> replaceNames = [..._names];
    String name;

    for (var i = 0; i < players; i++) {
      int choice = random.nextInt(replaceNames.length);

      name = replaceNames[choice];
      replaceNames.removeAt(choice);
      rule = rule.replaceAll("{{$i}}", name);
    }
    return rule;
  }

  String takeDecider(String rule) {
    final List<String> choice = [
      "drink {[0]} time",
      "give out {[0]} drink",
    ];
    Random rng = Random();
    // Detrimine if to drink or to give out.
    rule = rule.replaceAll("{{drink}}", choice[rng.nextInt(choice.length)]);
    return rule;
  }

  String sipDecider(String rule, int elements) {
    Random rng = Random();

    for (var i = 0; i < elements; i++) {
      // Random sips between 1 and 5, 6 is exclusive.
      final shuffledistribution = [
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
      int sips = (shuffledistribution.toList()..shuffle())
          .elementAt(rng.nextInt(shuffledistribution.length));
      rule = rule.replaceAll("{[$i]}", sips.toString());
//       print(rule);
      if (sips != 1) {
        rule = rule.replaceAll("$sips time", "$sips times");
        rule = rule.replaceAll("$sips drink", "$sips drinks");
        rule = rule.replaceAll("$sips sip", "$sips sips");
      }
    }
    return rule;
  }
}
