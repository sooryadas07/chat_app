import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/message_model.dart';

class ChatController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Message>> getMessagesStream() {
    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(String sender, String text) async {
    final message = Message(
      sender: sender,
      text: text,
      timestamp: DateTime.now(),
    );

    await _firestore.collection('messages').add(message.toMap());
  }
}
