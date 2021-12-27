import 'package:finack/src/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/instance_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firestore_service.dart';

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
    return phoneNo != null && phoneNo != "";
  }

  Stream<User?> get getAuthStream => FirebaseAuth.instance.authStateChanges();
  Stream<User?> get getIdTokenUpdates => FirebaseAuth.instance.idTokenChanges();

  Future signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception("Google sign in failed");
    }
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    User user =
    (await FirebaseAuth.instance.signInWithCredential(credential)).user!;

    Get.find<FirestoreHelper>().addUpdateUserData(user);
  }

  Future savePhoneNo(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.currentUser!.updatePhoneNumber(credential);
    Get.find<FirestoreHelper>().updatePhoneNo();
  }

  Future verifyPhone(
      String phoneNo, {
        required Function(PhoneAuthCredential) verificationCompleted,
        required Function(FirebaseAuthException) verificationFailed,
        required Function(String, int?) codeSent,
        required Function(String) codeRetrievalTimeout,
      }) {
    return FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeRetrievalTimeout,
    );
  }

  Future signInWithEmail(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (FirebaseAuth.instance.currentUser != null) {
      Get.find<FirestoreHelper>()
          .addUpdateUserData(FirebaseAuth.instance.currentUser!);
    }
  }

  Future sendPasswordResetEmail(String email) =>
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}