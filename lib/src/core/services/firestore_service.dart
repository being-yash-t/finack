import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/core/entities/transaction.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  void addUpdateUserData(User user) =>
      FirebaseFirestore.instance.collection(usersCollection).doc(user.uid).set({
        'displayName': user.displayName,
        'email': user.email,
        'phoneNo': user.phoneNumber,
        'photoURL': user.photoURL,
      }, SetOptions(merge: true));

  void updatePhoneNo(String uid, String? phoneNumber) {
    FirebaseFirestore.instance.collection(usersCollection).doc(uid).set({
      'phoneNo': phoneNumber,
    }, SetOptions(merge: true));
  }

  void newDebitTransaction(DebitTransaction debitTransaction) {}
}
