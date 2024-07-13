import 'package:flutter/material.dart';
import 'package:messaging_app/ChatScreen.dart';
import 'package:messaging_app/ContactsListPage.dart';

import 'package:messaging_app/ProfilePage.dart';
import 'package:messaging_app/SettingsPage.dart';
import 'package:messaging_app/SignInScreen.dart';
import 'package:messaging_app/chatbot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Messaging App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/signin', // Route initiale de l'application
      routes: {
        '/signin': (context) => SignInScreen(),
        '/chat': (context) => ChatScreen(),
        '/profile': (context) => ProfilePage(),
        '/contacts': (context) => ContactsListPage(),
        '/settings': (context) => SettingsPage(),
        '/chatbot': (context) => const ChatBotScreen(),
        // Ajoutez d'autres routes au besoin
      },
    );
  }
}
