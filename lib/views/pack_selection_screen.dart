import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:zuupen/controllers/database_provider.dart';
import 'package:zuupen/controllers/http_provider.dart';
import 'package:zuupen/controllers/packs_controller.dart';
import 'package:zuupen/routes/router.gr.dart';

import '../enums/enums.dart';
import '../theme/text_styles.dart';
import '../widgets/scaffold_base.dart';

class PackSelectionScreen extends ConsumerWidget {
  const PackSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _response = ref.watch(responseProvider);
    return ScaffoldBase(
      children: [
        const Text(
          'Select Deck',
          style: CustomTextStyles.header,
        ),
        _response.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => const MidColumn(),
          data: (data) {
            if (!data) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Couldn't retrieve the cards."),
                ),
              );
            }
            return const MidColumn();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () => AutoRouter.of(context).navigate(const GameRoute()),
            child: const Text('Play'))
      ],
    );
  }
}

class MidColumn extends ConsumerWidget {
  const MidColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _database = ref.watch(databaseProvider);

    return Column(
      children: [
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.cocktail),
          title: const Text('Getting Started'),
          subtitle: Text(
              'Let\'s get this party started.\n${_database[GameCategory.gettingStarted]!.length} cards'),
          gameCategory: GameCategory.gettingStarted,
        ),
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.diagnoses),
          title: const Text('Raising The Stakes'),
          subtitle: Text(
              'Time to go a step further.\n${_database[GameCategory.raisingTheStakes]!.length} cards'),
          gameCategory: GameCategory.raisingTheStakes,
        ),
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.fire),
          title: const Text('Caliente'),
          subtitle: Text(
              'Is starting to get hot in here.\n${_database[GameCategory.caliente]!.length} cards'),
          gameCategory: GameCategory.caliente,
        ),
      ],
    );
  }
}

class PackCard extends ConsumerWidget {
  const PackCard({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.gameCategory,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final GameCategory gameCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _packs = ref.watch(toggledPacksProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        child: GestureDetector(
          onTap: () {
            ref.read(toggledPacksProvider.notifier).togglePack(gameCategory);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).backgroundColor,
            ),
            child: ListTile(
              leading: leading,
              title: title,
              subtitle: subtitle,
              trailing: Checkbox(
                value: _packs[gameCategory],
                onChanged: (value) {
                  ref
                      .read(toggledPacksProvider.notifier)
                      .togglePack(gameCategory);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
