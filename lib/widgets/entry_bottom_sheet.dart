import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/entry_controller.dart';
import '../controllers/player_controller.dart';

class EntryBottomSheet extends StatelessWidget {
  const EntryBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EntryController _controller = Get.find();

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Add Player',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller.textEditingController,
                ),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.find<PlayerController>().addPlayer(
                name: _controller.textEditingController.text,
              );

              Get.back();
            },
            icon: const FaIcon(FontAwesomeIcons.plus),
            label: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
