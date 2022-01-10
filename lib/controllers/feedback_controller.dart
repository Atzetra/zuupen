import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> submitFeedback() async {
    final _feedbackText = textController.text;
    if (dropdownValue.value == 'General Feedback') {
      final CollectionReference _users =
          FirebaseFirestore.instance.collection('generalFeedback');

      return _users.add({
        'feedbackText': _feedbackText,
      }).then((value) => null);
    } else {
      final CollectionReference _users =
          FirebaseFirestore.instance.collection('cardSuggestions');

      return _users.add({
        'feedbackText': _feedbackText,
      }).then((value) => null);
    }
  }
}
