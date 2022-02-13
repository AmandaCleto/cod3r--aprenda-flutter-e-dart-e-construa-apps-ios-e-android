import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<ChatNotificationService>(context);
    final items = services.items;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Notificações'),
      ),
      body: ListView.builder(
        itemCount: services.itemsCount,
        itemBuilder: (context, index) => ListTile(
          title: Text(items[index].title),
          subtitle: Text(items[index].body),
          onTap: () => services.remove(index),
        ),
      ),
    );
  }
}
