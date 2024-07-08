import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversation'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(
                // Avatar de l'utilisateur avec qui la conversation est en cours
                ),
            title: const Text('Nom de l\'utilisateur'),
            subtitle: const Text('Dernier message'),
            onTap: () {
              // Action pour ouvrir la conversation complète
            },
          ),
          // Ajoutez d'autres messages ou interactions de conversation
        ],
      ),
    );
  }
}
