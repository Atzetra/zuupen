import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/entry_controller.dart';
import 'package:zuupen/controllers/player_controller.dart';
import 'package:zuupen/models/player.dart';
import 'package:zuupen/widgets/entry_bottom_sheet.dart';
import 'package:zuupen/widgets/scaffold_base.dart';

class PlayerEntry extends StatelessWidget {
  static const String id = 'PlayerEntry';

  const PlayerEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EntryController _controller = Get.find();
    final PlayerController _playerCtrl = Get.find();

    return ScaffoldBase(
      children: [
        const Text(
          'Add Players',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Material(
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            width: MediaQuery.of(context).size.width,
            child: Obx(
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
                            if (_playerCtrl.players[index].gender ==
                                Gender.female)
                              const FaIcon(FontAwesomeIcons.female)
                            else
                              const FaIcon(FontAwesomeIcons.male),
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
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.play),
                label: const Text('Play')),
            TextButton.icon(
                onPressed: () => Get.bottomSheet(
                      EntryBottomSheet(controller: _controller),
                    ),
                icon: const FaIcon(FontAwesomeIcons.plus),
                label: const Text('Add Player')),
          ],
        ),
      ],
    );
  }
}
