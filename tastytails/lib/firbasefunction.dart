import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tastytails/firebase_options.dart';

class FirestoreServices {
  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
  }
}
