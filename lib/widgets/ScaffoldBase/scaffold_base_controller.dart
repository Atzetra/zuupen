import 'package:auto_route/auto_route.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import '../../routes/router.gr.dart';
import 'scaffold_base_model.dart';

class ScaffoldBaseController {
  final _model = ScaffoldBaseModel();

  Future<void> popUpHandler(BuildContext context, String value) async {
    switch (value) {
      case 'feedback':
        BetterFeedback.of(context).show((UserFeedback feedback) async {
          try {
            await _model.sendFeedback(feedback);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Feedback Sent!',
                ),
              ),
            );
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  e.toString(),
                ),
              ),
            );
          }
        });
        break;
      case 'suggestion':
        AutoRouter.of(context).push(const FeedbackRoute());
        break;
      default:
        break;
    }
  }
}
