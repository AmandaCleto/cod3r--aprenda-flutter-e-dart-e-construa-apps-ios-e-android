import 'dart:async';
import 'package:chat/core/models/chat_user.dart';
import 'dart:io';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static final _userStream = Stream<ChatUser?>.multi((controller) async {
    //listen the changes in authentication
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      //when a new user comes, it is set in currentUser and added in controller
      _currentUser = user == null ? null : _toChatUser(user);

      controller.add(_currentUser);
    }
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup(
    String email,
    String password,
    String name,
    File? image,
  ) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) {
      return;
    }

    //1. upload user image
    final imageName = '${credential.user!.uid}.jpg';
    final imageUrl = await _uploadUserImage(image, imageName);

    //2. update user attributes
    await credential.user?.updateDisplayName(name);
    await credential.user?.updatePhotoURL(imageUrl);

    //3. save user in database
    _currentUser = _toChatUser(credential.user!, imageUrl, name);
    await _saveChatUser(_currentUser!);
  }

  Future<String> _uploadUserImage(File? image, String imageName) async {
    if (image == null) {
      return '';
    }

    final storage = FirebaseStorage.instance;

    final imageRef =
        storage.ref().child('user_images').child(imageName); //standard bucket
    await imageRef.putFile(image).whenComplete(() {});

    return await imageRef.getDownloadURL();
  }

  Future<void> _saveChatUser(ChatUser user) async {
    final storage = FirebaseFirestore.instance;
    final docRef = storage.collection('users').doc(
          user.id,
        ); //column id from users table

    return docRef.set({
      'name': user.name,
      'email': user.email,
      'imageUrl': user.image,
    });
  }

  static ChatUser _toChatUser(User user, [String? imageUrl, String? name]) {
    return ChatUser(
      id: user.uid,
      name: name ?? user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      image: imageUrl ?? user.photoURL ?? '',
    );
  }
}
