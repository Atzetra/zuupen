import 'package:get/get.dart';
import 'package:zuupen/enums/enums.dart';
import 'package:zuupen/models/player.dart';

class PlayerController extends GetxController {
  final players = <Player>[].obs;

  void addPlayer({required String name, required bool genderValue}) {
    Gender gender;

    if (!genderValue) {
      gender = Gender.female;
    } else {
      gender = Gender.male;
    }

    players.add(Player(name: name, gender: gender));
  }

  void removePlayer(int index) {
    players.removeAt(index);
  }
}
