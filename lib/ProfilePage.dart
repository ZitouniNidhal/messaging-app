import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://example.com/user_profile_image.jpg'), // Insérer l'URL de l'image de profil
            ),
            const SizedBox(height: 20),
            const Text(
              'Nom d''utilisateur',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action pour modifier le profil
              },
              child: const Text('Modifier le profil'),
            ),
          ],
        ),
      ),
    );
  }
}