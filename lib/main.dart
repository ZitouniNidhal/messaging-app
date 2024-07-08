import 'package:flutter/material.dart';
import 'package:messaging_app/ChatScreen.dart';
import 'package:messaging_app/SignInScreen.dart';


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
      home: SignInScreen(),
      routes: {
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
