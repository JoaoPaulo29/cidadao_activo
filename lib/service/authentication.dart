import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> register(
      {required String name,
      required String password,
      required String email}) async {
    try {
      UserCredential userCredential = await _authService
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      await _firestore.collection('users').doc(user!.uid).set({
        'id': user.uid,
        'name': name,
        'email': email,
        'photoUrl': null,
      });

      return user;
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      return null;
    }
  }

    Future<String?> login(
      {required String email, required String password}) async {
    try {
      await _authService.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logOut() async {
    return _authService.signOut();
  }
}
