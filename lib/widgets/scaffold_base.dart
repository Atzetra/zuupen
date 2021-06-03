import 'package:flutter/material.dart';

class ScaffoldBase extends StatelessWidget {
  final List<Widget>? children;

  const ScaffoldBase({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children!,
            ),
          ),
        ),
      ),
    );
  }
}
