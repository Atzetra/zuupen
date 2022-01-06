import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/player_controller.dart';
import '../widgets/entry_bottom_sheet.dart';
import '../widgets/scaffold_base.dart';
import 'pack_selection.dart';

class PlayerEntry extends StatelessWidget {
  static const String id = '/PlayerEntry';

  const PlayerEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayerController _playerCtrl = Get.find();

    return ScaffoldBase(
      children: [
        Material(
          elevation: 2,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Players',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Obx(
                    () => _playerCtrl.players.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text('No Players Yet'),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: _playerCtrl.players.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Text(_playerCtrl.players[index].name),
                                  const Spacer(),
                                  TextButton(
                                      onPressed: () {
                                        _playerCtrl.removePlayer(index);
                                      },
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      )),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_playerCtrl.players.length >= 2)
              ElevatedButton.icon(
                  onPressed: () => Get.toNamed(PackSelection.id),
                  icon: const FaIcon(FontAwesomeIcons.play),
                  label: const Text('Play'))
            else
              const ElevatedButton(
                  onPressed: null, child: Text('Not enough players')),
            TextButton.icon(
                onPressed: () => Get.bottomSheet(
                      const EntryBottomSheet(),
                    ),
                icon: const FaIcon(FontAwesomeIcons.plus),
                label: const Text('Add Player')),
          ],
        ),
      ],
    );
  }
}
