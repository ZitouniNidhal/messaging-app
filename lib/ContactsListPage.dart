import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  final List<String> contacts = List.generate(10, (index) => 'Contact $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _showContactDetails(context, contacts[index]);
            },
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/avatar.png'), // Exemple d'image d'avatar
              ),
              title: Text(contacts[index]),
              subtitle: const Text('Statut du contact'),
            ),
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, String contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails du contact'),
        content: Text('Vous avez sélectionné $contact'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}
