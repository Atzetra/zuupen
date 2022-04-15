import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../controllers/cards_controller.dart';
import '../controllers/game_controller.dart';
import '../routes/router.gr.dart';
import '../widgets/ScaffoldBase/scaffold_base.dart';

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
      onWillPop: () async {
        bool _action = false;
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
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            });
        return _action;
      },
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
