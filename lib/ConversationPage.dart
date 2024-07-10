import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConversationPage extends StatelessWidget {
  final String conversationId;

  const ConversationPage({required this.conversationId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('conversations')
            .doc(conversationId)
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final messages = snapshot.data!.docs;
          return ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/avatar.png'), // Exemple d'image d'avatar
                ),
                title: Text(message['text']),
                subtitle: Text(message['senderName']),
              );
            },
          );
        },
      ),
      bottomNavigationBar: _MessageInputField(conversationId: conversationId),
    );
  }
}

class _MessageInputField extends StatefulWidget {
  final String conversationId;

  const _MessageInputField({required this.conversationId});

  @override
  __MessageInputFieldState createState() => __MessageInputFieldState();
}

class __MessageInputFieldState extends State<_MessageInputField> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection('conversations')
          .doc(widget.conversationId)
          .collection('messages')
          .add({
        'text': _controller.text,
        'senderId': user.uid,
        'senderName': user.displayName ?? 'Unknown',
        'timestamp': Timestamp.now(),
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter your message',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
