import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart'; // For formatting time

class ChatScreen extends StatefulWidget {
  final String groupName;

  const ChatScreen({Key? key, required this.groupName}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<Map<String, dynamic>> _messages = [
    {
      'message': "Hello everyone!",
      'sender': "Alice",
      'isMe': false,
      'imageUrl': "assets/avatar4.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
    {
      'message': "Hi, how are you?",
      'sender': "Bob",
      'isMe': false,
      'imageUrl': "assets/avatar5.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
    {
      'message': "Let's discuss the project updates.",
      'sender': "Charlie",
      'isMe': false,
      'imageUrl': "assets/avatar6.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
    {
      'message': "I'm currently working on the design.",
      'sender': "Alice",
      'isMe': false,
      'imageUrl': "assets/avatar4.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
    {
      'message': "Don't forget the deadline is Friday!",
      'sender': "Bob",
      'isMe': false,
      'imageUrl': "assets/avatar5.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
    {
      'message': "Got it! Thanks for the reminder.",
      'sender': "Charlie",
      'isMe': false,
      'imageUrl': "assets/avatar6.png",
      'time': DateFormat.jm().format(DateTime.now()),
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'message': _messageController.text,
          'sender': 'You',
          'isMe': true,
          'imageUrl': '',
          'time': DateFormat.jm().format(DateTime.now()),
        });
        _messageController.clear();
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _messages.add({
          'message': 'Image: ${pickedFile.name}',
          'sender': 'You',
          'isMe': true,
          'imageUrl': pickedFile.path,
          'time': DateFormat.jm().format(DateTime.now()),
        });
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _messages.add({
          'message': 'File: ${result.files.single.name}',
          'sender': 'You',
          'isMe': true,
          'imageUrl': '',
          'time': DateFormat.jm().format(DateTime.now()),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            // Group Info
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, top: 7),
                  child: IconButton(
                    icon: const Icon(EvaIcons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'DB',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.groupName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      "6 members, 3 online",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),

            // Messages List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return _buildMessage(
                    msg['message'],
                    msg['sender'],
                    msg['isMe'],
                    msg['imageUrl'],
                    msg['time'],
                  );
                },
              ),
            ),
            // Message Input Field
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/home_avatar.png'),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: "Type your message...",
                            border: InputBorder.none, // Remove the bottom line
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          icon: const Icon(EvaIcons.arrow_right),
                          onPressed: _sendMessage,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      icon: const Icon(Icons.photo_rounded),
                      onPressed: _pickImage,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                        icon: const Icon(EvaIcons.link_2),
                        onPressed: _pickFile,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Method to build individual chat message
  Widget _buildMessage(String message, String senderName, bool isMe,
      String imageUrl, String time) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Profile Picture (only for non-user messages)
          if (!isMe)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imageUrl),
            ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              // Sender's Name (only for non-user messages)
              if (!isMe)
                Text(
                  senderName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              // Message Container
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: isMe ? Colors.blueAccent : Colors.grey[300],
                    borderRadius: isMe
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20))
                        : const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                child: Text(
                  message,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
              ),
              // Time
              Text(
                time,
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
