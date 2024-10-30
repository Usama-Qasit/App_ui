
import 'package:flutter/material.dart';
import 'package:testing_ui/Models/chat_model.dart';

class MailViewModel extends ChangeNotifier {
  List<ChatModel> _chats = [];

  List<ChatModel> get chats => _chats;

  MailViewModel() {
    _chats = [
      ChatModel(name: "Alice", lastMessage: "Let's meet at 5 PM", avatarPath: 'assets/avatar5.png', isOnline: true, unreadMessages: 2),
      ChatModel(name: "Design Team", lastMessage: "New design files are ready!", avatarPath: '', isOnline: true),
      ChatModel(name: "Charlie", lastMessage: "Happy Birthday!", avatarPath: 'assets/avatar2.png', isOnline: true, unreadMessages: 3),
      
    ];
  }

  void addChat(ChatModel chat) {
    _chats.add(chat);
    notifyListeners();
  }
}