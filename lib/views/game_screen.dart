import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/game_controller.dart';
import 'package:zuupen/widgets/scaffold_base.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);
  static String id = '/GameScreen';

  @override
  Widget build(BuildContext context) {
    final GameController _gameController = Get.find();
    return WillPopScope(
      onWillPop: _gameController.backHandler,
      child: GestureDetector(
        onTap: _gameController.nextCard,
        child: Obx(
          () => ScaffoldBase(
            backgroundColor: _gameController.cardColor,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _gameController.categoryText,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 10),
              Text(
                _gameController.cardText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
