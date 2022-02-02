import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../enums/enums.dart';

class ScaffoldBaseModel {
  Future<FeedbackStatus> sendFeedback(UserFeedback feedback) async {
    final _connectionStatus = await Connectivity().checkConnectivity();
    final _dateTime = DateTime.now();
    final String? _downloadUrl;

    if (_connectionStatus != ConnectivityResult.ethernet &&
        _connectionStatus != ConnectivityResult.mobile &&
        _connectionStatus != ConnectivityResult.wifi) {
      return FeedbackStatus.noInternet;
    } else {
      try {
        await FirebaseStorage.instance
            .ref('screenshots/${_dateTime.toUtc()}.png')
            .putData(feedback.screenshot);

        _downloadUrl = await FirebaseStorage.instance
            .ref('screenshots/${_dateTime.toUtc()}.png')
            .getDownloadURL();

        final _firestore =
            FirebaseFirestore.instance.collection('generalFeedback');

        await _firestore
            .add({
              'datetime': _dateTime.toString(),
              'feedback': feedback.text,
              'screenshot': _downloadUrl,
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
