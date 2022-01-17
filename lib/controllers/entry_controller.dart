import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/player_controller.dart';

class EntryController extends GetxController {
  final _controller = Get.find<PlayerController>();
  final _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController get textEditingController => _textEditingController;
  GlobalKey<FormState> get formKey => _formKey;

  void addPlayer() {
    if (_formKey.currentState!.validate()) {
      _controller.addPlayer(name: _textEditingController.text);
      _textEditingController.clear();
      Get.back();
    }
  }
}
