import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zuupen/routes/router.gr.dart';

import '../widgets/scaffold_base.dart';

class LaunchScreen extends StatelessWidget {
  static const String id = '/LaunchScreen';

  const LaunchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      isLast: true,
      children: [
        const Text(
          'Zuupen',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).navigate(const PlayerEntryRoute());
                  },
                  child: const Text('Play'),
                ),
              ),
              FutureBuilder(
                future: getInfo(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return IconButton(
                    onPressed: () => showAboutDialog(
                        context: context,
                        applicationVersion: snapshot.data,
                        applicationLegalese: '© Enzo Sastrokarijo',
                        applicationIcon:
                            const FaIcon(FontAwesomeIcons.wineGlass),
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'I am not responsible for any harm caused by using this app. Picolo can suck my dick by using subscriptions while I already paid for the full version. My own version is better anyways.',
                            ),
                          )
                        ]),
                    icon: const Icon(Icons.info_outline),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<String> getInfo() async {
    final _packageInfo = await PackageInfo.fromPlatform();
    return _packageInfo.version;
  }
}
