import 'dart:math';

import 'package:get/get.dart';
import 'package:zuupen/constants/extensions/string_extensions.dart';
import 'package:zuupen/controllers/packs_controller.dart';
import 'package:zuupen/controllers/player_controller.dart';
import 'package:zuupen/models/game_card.dart';
import 'package:zuupen/models/pack.dart';

class CardsController extends GetxController {
  // Load in needed controllers for this class
  final PlayerController _playerController = Get.find<PlayerController>();
  final PacksController _packsController = Get.find<PacksController>();

  List<GameCard> cards = <GameCard>[];
  List<String> names = <String>[];
  CardsController();

  void cardPopulator() {
    // Add all selected decks to card pile
    for (Pack pack in _packsController.selectedPacks) {
      cards = cards + pack.cards;
    }

    // Add names
    for (var player in _playerController.players) {
      names.add(player.name);
    }

    // Get names into the decks
    for (GameCard card in cards) {
      card.firstLine = ruleParser(card.firstLine, card.players, card.elements);
      card.firstLine = card.firstLine.capitalizer();
      print(card.firstLine);
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
    final Random _random = Random();
    // Reminder for self: using '=' for lists doesn't work...
    List<String> _replaceNames = [...names];
    String name;

    for (var i = 0; i < players; i++) {
      int choice = _random.nextInt(_replaceNames.length);

      name = _replaceNames[choice];
      _replaceNames.removeAt(choice);
      rule = rule.replaceAll("{{$i}}", name);
    }
    return rule;
  }

  String takeDecider(String rule) {
    final List<String> choice = [
      "drink {[0]} time",
      "give out {[0]} drink",
    ];
    final Random _rng = Random();
    // Detrimine if to drink or to give out.
    rule = rule.replaceAll("{{drink}}", choice[_rng.nextInt(choice.length)]);
    rule = sipDecider(rule, 1);
    return rule;
  }

  String sipDecider(String rule, int elements) {
    final Random _rng = Random();

    for (var i = 0; i < elements; i++) {
      // Random sips between 1 and 5, 6 is exclusive.
      int sips = 1 + _rng.nextInt(6);
      rule = rule.replaceAll("{[$i]}", sips.toString());
//       print(rule);
      if (sips != 1) {
        rule = rule.replaceAll("$sips time", "$sips times");
        rule = rule.replaceAll("$sips drink", "$sips drinks");
      }
    }
    return rule;
  }
}
