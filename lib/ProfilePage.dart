import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String _username = '';
  String _profileImageUrl = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    _user = _auth.currentUser;
    if (_user != null) {
      var userData = await _firestore.collection('users').doc(_user!.uid).get();
      setState(() {
        _username = userData['username'];
        _profileImageUrl = userData['profileImageUrl'] ??
            'https://example.com/default_profile_image.jpg';
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Vous pouvez télécharger cette image sur Firebase Storage et mettre à jour l'URL de l'image de profil
      // setState(() {
      //   _profileImageUrl = pickedFile.path;
      // });
    }
  }

  Future<void> _updateProfile(String username) async {
    if (_user != null) {
      await _firestore.collection('users').doc(_user!.uid).update({
        'username': username,
        // 'profileImageUrl': _profileImageUrl, // Mettez à jour l'URL de l'image si vous l'avez changée
      });
      setState(() {
        _username = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pushReplacementNamed(context, '/signin');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  _profileImageUrl), // Insérer l'URL de l'image de profil
            ),
            const SizedBox(height: 20),
            Text(
              _username,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Changer l\'image de profil'),
            ),
            ElevatedButton(
              onPressed: () {
                _showEditProfileDialog();
              },
              child: const Text('Modifier le profil'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog() {
    final TextEditingController _usernameController =
        TextEditingController(text: _username);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modifier le profil'),
          content: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Nom d\'utilisateur'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                _updateProfile(_usernameController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Sauvegarder'),
            ),
          ],
        );
      },
    );
  }
}
