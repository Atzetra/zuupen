import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zuupen/routes/router.gr.dart';

class ScaffoldBase extends StatelessWidget {
  final List<Widget>? children;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;
  final bool isLast;

  const ScaffoldBase({
    Key? key,
    required this.children,
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            if (!isLast)
              IconButton(
                  onPressed: () => AutoRouter.of(context).pop(),
                  icon: const Icon(Icons.arrow_back)),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: PopupMenuButton(
                onSelected: (_) =>
                    AutoRouter.of(context).push(const FeedbackRoute()),
                itemBuilder: (_) => <PopupMenuItem>[
                  const PopupMenuItem(
                    value: 'feedback',
                    child: Text(
                      'Send Feedback',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
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
