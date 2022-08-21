import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zuupen/controllers/game_controller.dart';

import '../controllers/cards_controller.dart';
import '../routes/router.gr.dart';
import '../widgets/ScaffoldBase/scaffold_base.dart';

class GameScreen extends HookConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameModel = ref.watch(gameProvider);
    final cardsController = ref.watch(cardsProvider);
    useEffect(() {
      cardsController.onInit();
      gameModel.onInit();
      return gameModel.onClose;
    }, const []);

    return WillPopScope(
      onWillPop: () async {
        bool action = false;
        await showDialog(
            context: context,
            builder: (scopeContext) {
              return AlertDialog(
                title: const Text('End Game?'),
                content: const Text('Do you want to exit and end this game?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(scopeContext).pop(false);
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).navigate(const PlayerEntryRoute());
                      Navigator.of(scopeContext).pop(false);
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            });
        return action;
      },
      child: GestureDetector(
        onTap: () => gameModel.nextCard(context),
        child: ScaffoldBase(
          backgroundColor: gameModel.cardColor,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              gameModel.categoryText,
              style: const TextStyle(color: Colors.white, fontSize: 40),
            ),
            const SizedBox(height: 10),
            Text(
              gameModel.cardText,
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
