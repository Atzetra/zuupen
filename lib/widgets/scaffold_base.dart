import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/views/feedback_screen.dart';

class ScaffoldBase extends StatelessWidget {
  final List<Widget>? children;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;

  const ScaffoldBase({
    Key? key,
    required this.children,
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            PopupMenuButton(
              itemBuilder: (_) => <PopupMenuItem>[
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(FeedbackScreen.id);
                    },
                    child: const Text(
                      'Send Feedback',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment,
                  mainAxisSize: MainAxisSize.min,
                  children: children!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
