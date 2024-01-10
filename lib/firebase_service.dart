import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseService() {
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    await _auth.signInAnonymously();
  }

  void addMessage(String message) {
    FirebaseFirestore.instance.collection('chat').add({
      'message': message,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Stream<QuerySnapshot> getChatStream() {
    return FirebaseFirestore.instance
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .limit(30) // Adjusted to a constant value
        .snapshots();
  }
}
