import 'package:chat/components/message_balloon.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              'Inicie uma conversa :D',
              style: TextStyle(
                color: Palette.customDarkBlueColor,
              ),
            ),
          );
        } else {
          final messages = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemBuilder: (context, i) {
              return MessageBalloon(
                message: messages[i],
                belongsToCurrentUser: currentUser?.id == messages[i].userId,
                key: ValueKey(
                  messages[i].id,
                ),
              );
            },
          );
        }
      },
    );
  }
}
