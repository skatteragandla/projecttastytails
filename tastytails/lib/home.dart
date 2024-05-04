import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:tastytails/sidebarsettings.dart';
import 'package:tastytails/food_menu.dart'; 

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  String? _searchValue;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                var user = snapshot.data;
                return UserAccountsDrawerHeader(
                  accountName: Text(user?.displayName ?? "Set Name"),
                  accountEmail: Text(user?.email ?? "Set Email"),
                  currentAccountPicture: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? Icon(Icons.person, size: 40.0)
                          : null,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                Navigator.pop(context);
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your ZIP CODE',
              ),
              onChanged: (value) {
                setState(() {
                  _searchValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_searchValue != null && _searchValue!.isNotEmpty) {
                  if (_searchValue == '95926' || _searchValue == '95928') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodMenuPage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Invalid ZIP CODE'),
                          content: Text('Please enter a valid ZIP CODE.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); 
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
