import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // insrance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, passowrd) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: passowrd,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw /*Exception*/ ("Väärä sähköposti tai salasana"); 
      
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, passowrd) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passowrd,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}
