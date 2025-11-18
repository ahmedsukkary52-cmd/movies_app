import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(User user) async {
    await firestore.collection('users').doc(user.uid).set({
      'name': user.displayName,
      'email': user.email,
      'uid': user.uid,
      'createdAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
