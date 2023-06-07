import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('Meetings ')
      .snapshots();

  void addToMeetingHistory(String MeetingName) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('Meetings ')
          .add({
        'meetingName': MeetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      print(e);
    }
  }
}
