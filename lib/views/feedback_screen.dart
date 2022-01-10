import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zuupen/controllers/feedback_controller.dart';
import 'package:zuupen/theme/text_styles.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);
  static String id = '/FeedbackScreen';

  @override
  Widget build(BuildContext context) {
    final FeedbackController _feedbackController = Get.find();
    return GestureDetector(
      onTap: () {
        final _currentFocus = FocusScope.of(context);

        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _feedbackController.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Feedback',
                  style: CustomTextStyles.header,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Feedback type:'),
                          Obx(
                            () => DropdownButton(
                              value: _feedbackController.dropdownValue.value,
                              items: _feedbackController.items
                                  .map(buildMenuItem)
                                  .toList(),
                              onChanged: (String? value) {
                                _feedbackController.dropdownChanger(value);
                              },
                            ),
                          ),
                          const Text('Feedback:'),
                          TextFormField(
                            controller: _feedbackController.textController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Can't be empty";
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              hintText:
                                  'Enter your feedback or card suggestions here',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_feedbackController.formKey.currentState!.validate()) {
                      await _feedbackController.submitFeedback();
                      Get.snackbar('Feedback sent!',
                          'The developer will take a look at it.');
                    }
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Send Feedback'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
}
