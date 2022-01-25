import 'package:flutter/material.dart';
import 'package:zuupen/views/player_entry_screen.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  static String id = '/EndScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Ehhh yes that was the game...'),
          ElevatedButton(
            onPressed: () => Get.offAllNamed(PlayerEntryScreen.id),
            child: const Text('Back to the Startscreen'),
          )
        ],
      ),
    );
  }
}
