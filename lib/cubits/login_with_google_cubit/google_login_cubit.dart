import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../logic/login_with_google/fireStore_service.dart';
import '../../logic/login_with_google/firebase_auth_service.dart';
import 'google_login_state.dart';

class GoogleLoginCubit extends Cubit<GoogleLoginState> {
  GoogleLoginCubit() : super(GoogleLoginState());

  static const String _webClientId =
      '697344950050-iniriof6senaor90gc74ff6amf7mv1c5.apps.googleusercontent.com';

  final FirebaseAuthService authService = FirebaseAuthService();
  final FirestoreService firestoreService = FirestoreService();

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      await GoogleSignIn.instance.initialize(serverClientId: _webClientId);

      final GoogleSignInAccount? googleUser =
      await GoogleSignIn.instance.authenticate();

      if (googleUser == null) {
        emit(state.copyWith(isLoading: false, error: "User canceled login"));
        return;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      print('idToken received: ${googleAuth.idToken != null}');
      final String? idToken = googleAuth.idToken;

      if (idToken == null) {
        emit(state.copyWith(
            isLoading: false,
            error:
            "No idToken returned. Check serverClientId & OAuth consent screen."));
        return;
      }

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final firebaseUser = await authService.signInWithCredential(credential);

      if (firebaseUser == null) {
        emit(state.copyWith(isLoading: false, error: "Firebase login failed"));
        return;
      }

      await firestoreService.saveUserData(firebaseUser);
      final token = await authService.getIdToken(firebaseUser);

      emit(state.copyWith(
        isLoading: false,
        isLoggedIn: true,
        name: firebaseUser.displayName,
        email: firebaseUser.email,
        uid: firebaseUser.uid,
        token: token,
        error: null,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Google Sign-In Error: $e"));
    }
  }
}
