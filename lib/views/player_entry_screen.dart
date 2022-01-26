import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zuupen/routes/router.gr.dart';
import '../controllers/player_controller.dart';

import '../widgets/entry_bottom_sheet.dart';
import '../widgets/scaffold_base.dart';

class PlayerEntryScreen extends ConsumerWidget {
  static const String id = '/PlayerEntry';

  const PlayerEntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _playerProvider = ref.watch(playerProvider);
    return ScaffoldBase(
      children: [
        Material(
          borderRadius: BorderRadius.circular(20),
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
                  _playerProvider.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('No Players Yet'),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: _playerProvider.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(_playerProvider[index].name),
                                const Spacer(),
                                TextButton(
                                    onPressed: () {
                                      ref
                                          .read(playerProvider.notifier)
                                          .removePlayer(index);
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    )),
                              ],
                            );
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_playerProvider.length >= 2)
              ElevatedButton.icon(
                onPressed: () =>
                    AutoRouter.of(context).navigate(const PackSelectionRoute()),
                icon: const FaIcon(FontAwesomeIcons.play),
                label: const Text('Play'),
              )
            else
              const ElevatedButton(
                  onPressed: null, child: Text('Not enough players')),
            TextButton.icon(
                onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => EntryBottomSheet()),
                icon: const FaIcon(FontAwesomeIcons.plus),
                label: const Text('Add Player')),
          ],
        ),
      ],
    );
  }
}
