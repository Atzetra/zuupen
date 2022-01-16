import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final items = ['General Feedback', 'Card Suggestion'];
  final dropdownValue = 'General Feedback'.obs;
  final _isLoading = false.obs;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }

  void dropdownChanger(String? value) {
    dropdownValue.value = value!;
  }

  Future<void> submitFeedback() async {
    _isLoading.value = true;
    update();
    final _feedbackText = textController.text;
    if (dropdownValue.value == 'General Feedback') {
      final CollectionReference _feedback =
          FirebaseFirestore.instance.collection('generalFeedback');

      _feedback.add({
        'feedbackText': _feedbackText,
      }).then((value) => null);
    } else {
      final CollectionReference _feedback =
          FirebaseFirestore.instance.collection('cardSuggestions');

      _feedback.add({
        'feedbackText': _feedbackText,
      }).then((value) => null);
    }
    _isLoading.value = false;
    update();
  }
}
