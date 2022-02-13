import 'dart:io';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boring_avatars/flutter_boring_avatars.dart';

class MessageBalloon extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBalloon({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser,
  }) : super(key: key);

  ImageProvider? _showUserImage(String userImage) {
    ImageProvider? provider;
    final uri = Uri.parse(userImage);

    if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(
        File(uri.toString()),
      );
    }
    return provider;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          mainAxisAlignment: belongsToCurrentUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth,
                  ),
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: belongsToCurrentUser ? 10.0 : 50.0,
                    right: belongsToCurrentUser ? 50.0 : 10.0,
                    bottom: 10.0,
                  ),
                  margin: const EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                    color: belongsToCurrentUser
                        ? Palette.customLightGreenColor
                        : Palette.customGrayColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                      bottomLeft: belongsToCurrentUser
                          ? const Radius.circular(10.0)
                          : Radius.zero,
                      bottomRight: belongsToCurrentUser
                          ? Radius.zero
                          : const Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: belongsToCurrentUser
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Text(
                          message.userName,
                          style: TextStyle(
                            fontSize: 12.0,
                            height: 1.2,
                            color: belongsToCurrentUser
                                ? Palette.customLightColor
                                : Palette.customDarkBlueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        message.text,
                        style: TextStyle(
                          fontSize: 14.0,
                          height: 1.2,
                          color: belongsToCurrentUser
                              ? Palette.customLightColor
                              : Palette.customDarkBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: belongsToCurrentUser ? null : 8.0,
                  right: belongsToCurrentUser ? 8.0 : null,
                  top: 10.0,
                  child: SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: message.userImage.isEmpty
                        ? AnimatedBoringAvatars(
                            duration: const Duration(milliseconds: 300),
                            name: message.userName,
                            colors: Palette.beanColors,
                            type: BoringAvatarsType.beam,
                          )
                        : CircleAvatar(
                            backgroundImage: _showUserImage(message.userImage),
                          ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
