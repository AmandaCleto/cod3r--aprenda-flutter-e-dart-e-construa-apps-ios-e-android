import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat/core/models/chat_user.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'dart:async';

class ChatFirebaseService implements ChatService {
  @override
  Stream<List<ChatMessage>> messagesStream() {
    final storage = FirebaseFirestore.instance;
    final snapshots = storage
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .orderBy('createAt', descending: true)
        .snapshots();

    return Stream<List<ChatMessage>>.multi((controller) {
      snapshots.listen((snapshot) {
        List<ChatMessage> list = snapshot.docs.map((doc) {
          return doc.data();
        }).toList();
        controller.add(list);
      });
    });

    //other way
    // return snapshots.map((snapshot) {
    //   return snapshot.docs.map((doc) {
    //     return doc.data();
    //   }).toList();
    // });
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final storage = FirebaseFirestore.instance;
    final message = ChatMessage(
      id: '',
      text: text,
      createAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImage: user.image,
    );

    final docRef = await storage
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(message);

    final snapshot = await docRef.get();
    return snapshot.data()!;
  }

  //transforming a ChatMessage into the type Map<dynamic, String>
  Map<String, dynamic> _toFirestore(
    ChatMessage message,
    SetOptions? options,
  ) {
    return {
      'text': message.text,
      'createAt': DateTime.now().toIso8601String(),
      'userId': message.userId,
      'userName': message.userName,
      'userImage': message.userImage,
    };
  }

  //transforming Map<dynamic, String> into ChatMessage
  ChatMessage _fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    return ChatMessage(
      createAt: DateTime.parse(doc['createAt']),
      id: doc.id,
      text: doc['text'],
      userId: doc['userId'],
      userImage: doc['userImage'],
      userName: doc['userName'],
    );
  }
}
