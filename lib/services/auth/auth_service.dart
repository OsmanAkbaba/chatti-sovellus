import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // insrance of auth & firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get current user stream
  User? getCurrentUser () {
    return _auth.currentUser;
  }
  // sign user in
  Future<UserCredential> signInWithEmailPassword(String email, passowrd) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: passowrd,
      );

      //save user info if it does not already exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, passowrd) async {
    try {
      //create user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: passowrd,
      );

      //save user data in a separate document
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
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
