import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static GoogleSignIn googleSignIn = GoogleSignIn.instance;
  Future<void> loginWithGoogle() async {
  await Future.delayed(const Duration(seconds: 3));
  print('success login with google');
  }
}
