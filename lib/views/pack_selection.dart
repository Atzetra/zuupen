import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zuupen/constants/packs/caliente.dart';
import 'package:zuupen/constants/packs/card_packs.dart';
import 'package:zuupen/controllers/packs_controller.dart';
import 'package:zuupen/views/game_screen.dart';

import '../enums/enums.dart';
import '../theme/text_styles.dart';
import '../widgets/scaffold_base.dart';

class PackSelection extends StatelessWidget {
  const PackSelection({Key? key}) : super(key: key);

  static const String id = '/PackSelection';

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      children: [
        const Text(
          'Select Deck',
          style: CustomTextStyles.header,
        ),
        Column(
          children: [
            PackCard(
              leading: const FaIcon(FontAwesomeIcons.cocktail),
              title: const Text('Getting Started'),
              subtitle: Text(
                  'Let\'s get this party started.\n${gettingStarted.length} cards'),
              gameCategory: GameCategory.gettingStarted,
            ),
            PackCard(
              leading: const FaIcon(FontAwesomeIcons.fire),
              title: const Text('Caliente'),
              subtitle: Text(
                  'Is starting to get hot in here.\n${caliente.length} cards'),
              gameCategory: GameCategory.caliente,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GetX<PacksController>(
          builder: (_controller) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: _getWidget(_controller.isEmpty)),
        ),
      ],
    );
  }

  Widget _getWidget(bool _empty) {
    if (_empty) {
      return ElevatedButton(
        key: const ValueKey(1),
        child: const Text('Select at least one pack'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: null,
      );
    } else {
      return ElevatedButton(
        key: const ValueKey(2),
        onPressed: () {
          Get.toNamed(GameScreen.id);
        },
        child: const Text('Play'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
      );
    }
  }
}

class PackCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final PacksController _pcksCtrlr = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        child: GestureDetector(
          onTap: () => _pcksCtrlr.togglePack(gameCategory),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).backgroundColor,
            ),
            child: ListTile(
              leading: leading,
              title: title,
              subtitle: subtitle,
              trailing: Obx(
                () => Checkbox(
                  value: _pcksCtrlr.toggledPacks[gameCategory],
                  onChanged: (value) {
                    _pcksCtrlr.togglePack(gameCategory);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
