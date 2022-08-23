import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  User? get currentUser => FirebaseAuth.instance.currentUser;
  String? get getCurrentUid => FirebaseAuth.instance.currentUser?.uid;

  /// throws [NoUserSignedInException] when no user is signed in
  String get getNNCurrentUid {
    String? nv = getCurrentUid;
    if (nv != null) {
      return nv;
    } else {
      throw NoUserSignedInException();
    }
  }

  bool get isSigned => FirebaseAuth.instance.currentUser != null;
  bool get hasPhoneVerified {
    final phoneNo = FirebaseAuth.instance.currentUser!.phoneNumber;
    return (phoneNo ?? '').trim().isNotEmpty;
  }

  Future<User> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception("Google sign in failed");
    }
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final singInResult = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      return singInResult.user!;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.stackTrace?.toString());
      throw ExceptionWithMessage(e.message ?? unknownError);
    }
  }

  Future<bool> savePhoneCredential(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.currentUser!.updatePhoneNumber(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.stackTrace?.toString());
      return false;
    }
  }

  Future verifyPhone(
    String phoneNo, {
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeRetrievalTimeout,
  }) =>
      FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeRetrievalTimeout,
      );

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      final signInResult =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return signInResult.user!;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.stackTrace?.toString());
      return null;
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.stackTrace?.toString());
      return false;
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
