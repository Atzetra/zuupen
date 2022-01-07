import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/cards_controller.dart';
import 'package:zuupen/controllers/packs_controller.dart';

import '../enums/enums.dart';
import '../theme/text_styles.dart';
import '../widgets/scaffold_base.dart';

class PackSelection extends StatelessWidget {
  const PackSelection({Key? key}) : super(key: key);

  static const String id = '/PackSelection';

  @override
  Widget build(BuildContext context) {
    final CardsController _cardsController = Get.find<CardsController>();

    return ScaffoldBase(
      children: [
        const Text(
          'Select decks',
          style: CustomTextStyles.header,
        ),
        Material(
          elevation: 2,
          child: Column(
            children: const [
              PackCard(
                leading: FaIcon(FontAwesomeIcons.cocktail),
                title: Text('Getting Started'),
                subtitle: Text('Let\'s get this party started.'),
                gameCategory: GameCategory.gettingStarted,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            _cardsController.cardPopulator();
          },
          child: Text('Play'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
          ),
        )
      ],
    );
  }
}

class PackCard extends StatelessWidget {
  const PackCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
    this.gameCategory,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final GameCategory? gameCategory;

  @override
  Widget build(BuildContext context) {
    final PacksController _pcksCtrlr = Get.find();
    return Container(
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
              _pcksCtrlr.togglePack(gameCategory!);
            },
          ),
        ),
      ),
    );
  }
}
