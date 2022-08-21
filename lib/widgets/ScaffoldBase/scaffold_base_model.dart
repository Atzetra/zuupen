import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../enums/enums.dart';

class ScaffoldBaseModel {
  Future<FeedbackStatus> sendFeedback(UserFeedback feedback) async {
    final connectionStatus = await Connectivity().checkConnectivity();
    final dateTime = DateTime.now();
    final String? downloadUrl;

    if (connectionStatus != ConnectivityResult.ethernet &&
        connectionStatus != ConnectivityResult.mobile &&
        connectionStatus != ConnectivityResult.wifi) {
      return FeedbackStatus.noInternet;
    } else {
      try {
        await FirebaseStorage.instance
            .ref('screenshots/${dateTime.toUtc()}.png')
            .putData(feedback.screenshot);

        downloadUrl = await FirebaseStorage.instance
            .ref('screenshots/${dateTime.toUtc()}.png')
            .getDownloadURL();

        final firestore =
            FirebaseFirestore.instance.collection('generalFeedback');

        await firestore
            .add({
              'datetime': dateTime.toString(),
              'feedback': feedback.text,
              'screenshot': downloadUrl,
            })
            .then((value) => FeedbackStatus.succes)
            .catchError((error) => error);

        // You should never be able to get here
        return FeedbackStatus.unknown;
      } on FirebaseException catch (e) {
        return Future.error(e);
      } catch (e) {
        return Future.error(e);
      }
    }
  }
}
