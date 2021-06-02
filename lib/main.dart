import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/theme/app_theme.dart';
import 'package:zuupen/views/launch_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zuupen',
      theme: AppTheme().themeData(context),
      initialRoute: LaunchScreen.id,
      getPages: [
        GetPage(name: LaunchScreen.id, page: () => LaunchScreen()),
      ],
    );
  }
}
