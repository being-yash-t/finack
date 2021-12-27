import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  void addUpdateUserData(User user) =>
      FirebaseFirestore.instance.collection(usersCollection).doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'phoneNo': user.phoneNumber,
        'photoURL': user.photoURL,
      }, SetOptions(merge: true));

  void updatePhoneNo() {
    final user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance.collection(usersCollection).doc(user.uid).set({
      'phoneNo': user.phoneNumber,
    }, SetOptions(merge: true));
  }
}