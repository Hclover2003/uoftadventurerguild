import 'package:firebase_auth/firebase_auth.dart';
import 'package:uoftadventurerguild/models/appuser.dart';
import 'package:uoftadventurerguild/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // TODO: authentication with UTORauth

  //sign in with email & password
  Future<AppUser?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //register with email & password AND create doc in database
  Future registerWithEmailAndPassword(
      String name, String email, String password, UserData userData) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).createUserData(userData);
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
