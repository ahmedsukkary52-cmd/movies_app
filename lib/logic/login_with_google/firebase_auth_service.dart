import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signInWithCredential(AuthCredential credential) async {
    final userCredential = await auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<String?> getIdToken(User user) async {
    return await user.getIdToken();
  }
}
