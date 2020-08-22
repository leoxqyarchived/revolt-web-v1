import 'package:firebase/firebase.dart';
class AuthService{
  final Auth _firebaseAuth = auth();
  final GoogleAuthProvider _googleSignIn = GoogleAuthProvider();

  Future<UserCredential> signUp({String email, String password}) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email,
        password,
      );
    } catch (e) {
      print('Error siging in with credentials: $e');
      throw '$e';
      // throw Error('Error signing up with credentials: $e');
      // return e;
    }
  }
}