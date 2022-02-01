import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/cards_controller.dart';
import '../controllers/game_controller.dart';
import '../widgets/scaffold_base.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _gameProvider = ref.watch(gameProvider);
    final _cardsController = ref.watch(cardsProvider);
    useEffect(() {
      _cardsController.onInit();
      _gameProvider.onInit();
      return _gameProvider.onClose;
    }, const []);

    return WillPopScope(
      onWillPop: () => backHandler(context),
      child: GestureDetector(
        onTap: () => _gameProvider.nextCard(context),
        child: ScaffoldBase(
          backgroundColor: _gameProvider.cardColor,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _gameProvider.categoryText,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(height: 10),
            Text(
              _gameProvider.cardText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
