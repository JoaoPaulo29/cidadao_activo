import 'package:cidadao_activo/models/user_model.dart';
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

  Future<UserModel> getCurrentUser() async {
    try {
      User? user = _authService.currentUser;
      if (user != null) {
        QuerySnapshot querySnapshot = await _firestore
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          var userData =
              querySnapshot.docs.first.data() as Map<String, dynamic>;
          return UserModel(
            id: userData['id'],
            name: userData['name'],
            email: userData['email'],
            photoUrl: userData['photoUrl'],
          );
        } else {
          throw Exception('Usuário não encontrado no Firestore');
        }
      } else {
        throw Exception('Nenhum usuário logado');
      }
    } catch (e) {
      print(e);
      rethrow; // Rethrow a exceção para que o chamador possa lidar com isso adequadamente
    }
  }
}
