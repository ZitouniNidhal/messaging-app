import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Notifications'),
            subtitle: const Text('Activez ou désactivez les notifications'),
            trailing: Switch(
              value: true, // Exemple de valeur de commutation
              onChanged: (bool newValue) {
                // Action pour gérer les notifications
                // Vous pouvez implémenter ici la logique pour activer ou désactiver les notifications
              },
            ),
          ),
          ListTile(
            title: const Text('Thème'),
            subtitle: const Text('Personnalisez l\'apparence de l\'application'),
            onTap: () {
              // Navigation vers une nouvelle page pour gérer le thème
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeSettingsPage()),
              );
            },
          ),
          // Ajoutez d'autres paramètres au besoin
        ],
      ),
    );
  }
}

class ThemeSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thème'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Thème Clair'),
            onTap: () {
              // Action pour sélectionner le thème clair
              // Implémentez la logique pour changer le thème de l'application
            },
          ),
          ListTile(
            title: const Text('Thème Sombre'),
            onTap: () {
              // Action pour sélectionner le thème sombre
              // Implémentez la logique pour changer le thème de l'application
            },
          ),
          // Ajoutez d'autres options de thème au besoin
        ],
      ),
    );
  }
}
