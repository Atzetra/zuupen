import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// TODO: Convert to Statenotifier
final feedbackProvider =
    ChangeNotifierProvider<FeedbackController>((ref) => FeedbackController());

class FeedbackController extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final items = ['General Feedback', 'Card Suggestion'];
  String dropdownValue = 'General Feedback';
  bool _isLoading = false;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isLoading => _isLoading;

  void dropdownChanger(String? value) {
    dropdownValue = value!;
    notifyListeners();
  }

  Future<void> submitFeedback() async {
    _isLoading = true;
    notifyListeners();
    final _feedbackText = textController.text;
    if (dropdownValue == 'General Feedback') {
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
    _isLoading = false;
    notifyListeners();
  }
}
