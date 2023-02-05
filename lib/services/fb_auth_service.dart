import 'package:firebase_auth/firebase_auth.dart';

class FBAuthService {
  final FirebaseAuth _fbService;

  FBAuthService({fbService}) : _fbService = fbService;

  Future<UserCredential> onSignIn(String email, String password) async =>
      _fbService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<UserCredential> onSignUp(String email, String password) async =>
      _fbService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  Future<void> onLogout() async => _fbService.signOut();
}
