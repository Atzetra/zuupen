import 'package:flutter/material.dart';

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
        child: Center(
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
      ),
    );
  }
}
