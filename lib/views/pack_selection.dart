import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/text_styles.dart';
import '../widgets/scaffold_base.dart';

class PackSelection extends StatelessWidget {
  const PackSelection({Key? key}) : super(key: key);

  static const String id = '/PackSelection';

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(children: [
      const Text(
        'Select decks',
        style: CustomTextStyles.header,
      ),
      Material(
        elevation: 2,
        child: PackCard(
          leading: FaIcon(FontAwesomeIcons.cocktail),
          title: Text('Getting Started'),
          subtitle: Text('Let\'s get this party started.'),
        ),
      ),
    ]);
  }
}

class PackCard extends StatelessWidget {
  const PackCard({
    Key? key,
    this.leading,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
