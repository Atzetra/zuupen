import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/player_controller.dart';

class EntryBottomSheet extends HookConsumerWidget {
  const EntryBottomSheet({
    Key? key,
  }) : super(key: key);

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = useTextEditingController();
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
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
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Name'),
                      controller: _controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(playerProvider.notifier).addPlayer(_controller.text);
                  _controller.clear();
                  AutoRouter.of(context).pop();
                }
              },
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
