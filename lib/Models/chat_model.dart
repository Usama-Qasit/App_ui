// models/chat_model.dart
class ChatModel {
  final String name;
  final String lastMessage;
  final String avatarPath;
  final bool isOnline;
  final int unreadMessages;

  ChatModel({
    required this.name,
    required this.lastMessage,
    required this.avatarPath,
    required this.isOnline,
    this.unreadMessages = 0,
  });
}