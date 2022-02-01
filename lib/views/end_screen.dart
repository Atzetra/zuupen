import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../theme/text_styles.dart';

class EndScreen extends StatelessWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Game Over!', style: CustomTextStyles.header),
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).popUntilRoot(),
              child: const Text('Back to the Startscreen'),
            ),
          ],
        ),
      ),
    );
  }
}
