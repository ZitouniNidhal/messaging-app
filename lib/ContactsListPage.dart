import 'package:flutter/material.dart';

class ContactsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: 10, // Nombre de contacts à afficher
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
                // Avatar du contact
                ),
            title: Text('Contact $index'),
            subtitle: const Text('Statut du contact'),
            onTap: () {
              // Action lors du clic sur le contact
            },
          );
        },
      ),
    );
  }
}
