//sidebarsettings.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    initializeUserData();
  }

  void initializeUserData() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      _nameController.text = user.displayName ?? "";
      _emailController.text = user.email ?? "";
    } else {
      print("No user logged in");
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void updateUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await user.updateDisplayName(_nameController.text);
        await user.updateEmail(_emailController.text);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        setState(() {});

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated successfully')));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? 'Error occurred')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isUpdating ? null : updateUserDetails,
              child: Text('Update Details'),
            ),
          ],
        ),
      ),
    );
  }
}
