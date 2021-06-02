import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  static const String id = 'LaunchScreen';

  const LaunchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Zuupen',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Play'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
