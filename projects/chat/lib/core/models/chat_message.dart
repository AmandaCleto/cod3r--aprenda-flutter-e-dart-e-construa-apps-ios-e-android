class ChatMessage {
  final String id;
  final String text;
  final DateTime createAt;

  final String userId;
  final String userName;
  final String userImage;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.createAt,
    required this.userId,
    required this.userName,
    required this.userImage,
  });
}
