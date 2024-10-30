// Views/mail_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_ui/Models/chat_model.dart';
import 'package:testing_ui/View%20model/mail_view_model.dart';
import 'package:testing_ui/Views/chat_screen.dart';
import 'package:icons_plus/icons_plus.dart';

class MailPage extends StatelessWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF2F4F7),
      body: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(EvaIcons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)), // Color when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey), // Color when focused
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 22.0), // Adjust vertical padding
            ),
          ),
          // Pinned Chats Heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PINNED',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
          ),
          // Pinned Chats List
          Expanded(
            child: Consumer<MailViewModel>(
              builder: (context, mailViewModel, child) {
                return ListView.builder(
                  itemCount: mailViewModel.chats.length,
                  itemBuilder: (context, index) {
                    final chat = mailViewModel.chats[index];
                    return _buildChatItem(context, chat);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, ChatModel chat) {
    return GestureDetector(
      onTap: () => _navigateToChatScreen(context, chat.name),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.4),
          ),
          child: ListTile(
            leading: chat.avatarPath.isNotEmpty
                ? CircleAvatar(radius: 25, backgroundImage: AssetImage(chat.avatarPath))
                : Container(
                    decoration: BoxDecoration(color: Colors.deepOrange, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    child: const Text(
                      'DB',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
            title: Text(chat.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat.lastMessage),
            trailing: chat.unreadMessages > 0
                ? Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '${chat.unreadMessages}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  void _navigateToChatScreen(BuildContext context, String groupName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatScreen(groupName: groupName)),
    );
  }
}