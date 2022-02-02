import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/feedback_controller.dart';
import '../theme/text_styles.dart';

class FeedbackScreen extends HookConsumerWidget {
  const FeedbackScreen({Key? key}) : super(key: key);
  static String id = '/FeedbackScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _feedbackProvider = ref.watch(feedbackProvider);
    final _textController = useTextEditingController();
    return GestureDetector(
      onTap: () {
        final _currentFocus = FocusScope.of(context);

        if (!_currentFocus.hasPrimaryFocus) {
          _currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _feedbackProvider.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Card Suggestion',
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
                              const Text('Card Suggestion:'),
                              TextFormField(
                                controller: _textController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Can't be empty";
                                  }
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your card suggestion here.',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_feedbackProvider.isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_feedbackProvider.formKey.currentState!
                              .validate()) {
                            await _feedbackProvider
                                .submitFeedback(_textController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Suggestion sent succesfully!'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.send),
                        label: const Text('Send Suggestion'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Suggestions given here will be sent and collected to my own server. Data entered here will only be used for improving the app.',
                      style: TextStyle(color: Colors.white38),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
