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
            onTap: () {
              // Action pour gérer les notifications
            },
          ),
          ListTile(
            title: const Text('Thème'),
            onTap: () {
              // Action pour gérer le thème
            },
          ),
          // Ajoutez d'autres paramètres au besoin
        ],
      ),
    );
  }
}
