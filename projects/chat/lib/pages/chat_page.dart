import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:chat/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ('Chat: ${currentUser?.name}'),
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
            ),
          ),
          actions: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Palette.customLightColor,
                ),
                items: [
                  DropdownMenuItem(
                    value: 'logout',
                    child: SizedBox(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app,
                            color: Palette.customDarkBlueColor,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Sair',
                            style: TextStyle(
                              color: Palette.customDarkBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
                onChanged: (value) {
                  if (value == 'logout') {
                    AuthService().logout();
                  }
                },
              ),
            ),
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications,
                    color: Palette.customLightColor,
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: 5.0,
                  child: CircleAvatar(
                    maxRadius: 10.0,
                    backgroundColor: Palette.customDarkBlueColor,
                    child: Text(
                      '${Provider.of<ChatNotificationService>(context).itemsCount}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Palette.customLightColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Provider.of<ChatNotificationService>(context, listen: false).add(
        //       ChatNotification(
        //         body: Random().nextDouble().toString(),
        //         title: 'Mais uma notificação',
        //       ),
        //     );
        //   },
        //   child: const Icon(
        //     Icons.add,
        //   ),
        // ),
      ),
    );
  }
}
