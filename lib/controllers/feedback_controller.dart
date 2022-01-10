import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final items = ['General Feedback', 'Card Suggestion'];
  final dropdownValue = 'General Feedback'.obs;
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void dropdownChanger(String? value) {
    dropdownValue.value = value!;
  }

  void submitFeedback() {
    final _feedbackText = textController.text;
    print(_feedbackText);
    print(dropdownValue.value);
  }
}
