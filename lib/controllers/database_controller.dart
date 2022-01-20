import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/http_provider.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/game_card.dart';

class DatabaseController extends GetxController {
  final _gettingStarted = <GameCard>[].obs;
  final _caliente = <GameCard>[].obs;
  final _raisingStakes = <GameCard>[].obs;
  final Map<GameCategory, List<GameCard>> allPacks = {};
  List<GameCard> get gettingStarted => _gettingStarted;
  List<GameCard> get caliente => _caliente;
  List<GameCard> get raisingStakes => _raisingStakes;

  @override
  void onInit() async {
    await packRetriever();
    super.onInit();
  }

  Future<void> packRetriever() async {
    final responseCaliente =
        await HttpProvider().getData(dotenv.env['CALIENTE_API']);
    final responseGettingStarted =
        await HttpProvider().getData(dotenv.env['GETTINGSTARTED_API']);
    final responseRaisingStakes =
        await HttpProvider().getData(dotenv.env['RAISINGSTAKES_API']);

    if (responseGettingStarted.statusCode == 200 &&
        responseCaliente.statusCode == 200 &&
        responseRaisingStakes.statusCode == 200) {
      final List<dynamic> response = jsonDecode(responseGettingStarted.body);
      for (var _item in response) {
        _gettingStarted.add(
          GameCard.fromJson(_item),
        );
      }
      final List<dynamic> responseTwo = jsonDecode(responseCaliente.body);
      for (var _response in responseTwo) {
        _caliente.add(
          GameCard.fromJson(_response),
        );
      }
      final List<dynamic> responseThree =
          jsonDecode(responseRaisingStakes.body);
      for (var _response in responseThree) {
        _raisingStakes.add(
          GameCard.fromJson(_response),
        );
      }

      // Add packs to allPacks list
      allPacks[GameCategory.gettingStarted] = _gettingStarted;
      allPacks[GameCategory.caliente] = _caliente;
      allPacks[GameCategory.raisingTheStakes] = _raisingStakes;
    } else {
      await Get.dialog(AlertDialog(
        title: const Text("Can't load the gamecards"),
        content: const Text('Check your internet connection.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Ok'),
          ),
        ],
      ));
      throw Exception('Cant retrieve packs');
    }
  }
}
