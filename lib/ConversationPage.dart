import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

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
              backgroundImage:
                  AssetImage('assets/avatar.png'), // Exemple d'image d'avatar
            ),
            title: const Text('Nom de l\'utilisateur'),
            subtitle: const Text('Dernier message envoyé ou reçu'),
            onTap: () {
              // Navigation vers la conversation complète
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FullConversationPage()),
              );
            },
          ),
          // Ajoutez d'autres messages ou interactions de conversation
        ],
      ),
    );
  }
}

class FullConversationPage extends StatelessWidget {
  const FullConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nom de l\'utilisateur'),
      ),
      body: ListView(
        children: const <Widget>[
          // Afficher tous les messages de la conversation ici
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/avatar.png'), // Exemple d'image d'avatar
            ),
            title: Text('Message 1'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/avatar.png'), // Exemple d'image d'avatar
            ),
            title: Text('Message 2'),
          ),
          // Ajoutez d'autres messages au besoin
        ],
      ),
    );
  }
}
