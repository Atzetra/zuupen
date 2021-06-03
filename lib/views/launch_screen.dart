import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/views/player_entry.dart';
import 'package:zuupen/widgets/scaffold_base.dart';

class LaunchScreen extends StatelessWidget {
  static const String id = 'LaunchScreen';

  const LaunchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
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
            onPressed: () {
              Get.toNamed(PlayerEntry.id);
            },
            child: const Text('Play'),
          ),
        ),
      ],
    );
  }
}
