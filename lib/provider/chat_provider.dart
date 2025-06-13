import 'package:flutter/material.dart';
import '../model/message_model.dart';
import '../controllers/chat_controller.dart';

class ChatProvider with ChangeNotifier {
  final ChatController _controller = ChatController();

  Stream<List<Message>> get messagesStream => _controller.getMessagesStream();

  Future<void> sendMessage(String sender, String text) async {
    await _controller.sendMessage(sender, text);
    notifyListeners();
  }
}
