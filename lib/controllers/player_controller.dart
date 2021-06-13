import 'package:get/get.dart';

import '../enums/enums.dart';
import '../models/player.dart';

class PlayerController extends GetxController {
  final players = <Player>[].obs;
  final femaleCount = 0.obs;
  final maleCount = 0.obs;

  void addPlayer({required String name, required bool genderValue}) {
    Gender gender;

    if (!genderValue) {
      gender = Gender.female;
      femaleCount.value++;
    } else {
      gender = Gender.male;
      maleCount.value++;
    }

    players.add(Player(name: name, gender: gender));
  }

  void removePlayer(int index) {
    if (players[index].gender == Gender.female) {
      femaleCount.value--;
    } else {
      maleCount.value--;
    }
    players.removeAt(index);
  }
}
