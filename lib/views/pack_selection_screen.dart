import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/database_provider.dart';
import '../controllers/packs_controller.dart';
import '../enums/enums.dart';
import '../routes/router.gr.dart';
import '../theme/text_styles.dart';
import '../widgets/ScaffoldBase/scaffold_base.dart';

class PackSelectionScreen extends HookConsumerWidget {
  const PackSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final database = ref.watch(databaseProvider);
    return ScaffoldBase(
      children: [
        const Text(
          'Select Deck',
          style: CustomTextStyles.header,
        ),
        const MidColumn(),
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
    final database = ref.watch(databaseProvider);

    return Column(
      children: [
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.martiniGlass),
          title: const Text('Getting Started'),
          subtitle: Text(
              'Let\'s get this party started.\n${database[GameCategory.gettingStarted]!.length} cards'),
          gameCategory: GameCategory.gettingStarted,
        ),
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.personDotsFromLine),
          title: const Text('Raising The Stakes'),
          subtitle: Text(
              'Time to go a step further.\n${database[GameCategory.raisingTheStakes]!.length} cards'),
          gameCategory: GameCategory.raisingTheStakes,
        ),
        PackCard(
          leading: const FaIcon(FontAwesomeIcons.fire),
          title: const Text('Caliente'),
          subtitle: Text(
              'Is starting to get hot in here.\n${database[GameCategory.caliente]!.length} cards'),
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
    final packs = ref.watch(toggledPacksProvider);
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
                value: packs[gameCategory],
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
