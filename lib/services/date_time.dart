import 'package:cloud_firestore/cloud_firestore.dart';

Duration calculateElapsedTime(Timestamp timestamp) {
  DateTime currentTime = DateTime.now();
  DateTime timestampTime = timestamp.toDate();
  Duration difference = currentTime.difference(timestampTime);
  return difference;
}
