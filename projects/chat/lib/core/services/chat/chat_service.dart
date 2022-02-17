import 'package:chat/components/messages.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/services/chat/chat_firebase_service.dart';

import 'chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();

  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    // return ChatMockService();
    return ChatFirebaseService();
  }
}
