import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resoures/firestore_methods.dart';

class History_MeetingScreen extends StatelessWidget {
  const History_MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    'Room Name : ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                  ),
                ));
      },
    );
  }
}
