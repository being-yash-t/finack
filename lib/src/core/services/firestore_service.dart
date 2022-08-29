import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finack/src/core/constants/firebase.dart';
import 'package:finack/src/core/entities/transaction.dart';
import 'package:finack/src/features/create_bucket/model/bucket.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  void addUpdateUserData(User user) => FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(user.uid)
          .set({
        'displayName': user.displayName,
        'email': user.email,
        'phoneNo': user.phoneNumber,
        'photoURL': user.photoURL,
      }, SetOptions(merge: true));

  void updatePhoneNo(String uid, String? phoneNumber) {
    FirebaseFirestore.instance.collection(kUsersCollection).doc(uid).set({
      'phoneNo': phoneNumber,
    }, SetOptions(merge: true));
  }

  void newDebitTransaction(DebitTransaction debitTransaction) {}

  Stream<double?> currentSalary(String userId) => FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(userId)
          .snapshots()
          .map((event) {
        final data = event.data();
        if (data == null) return null;
        if (data.containsKey('monthly-salary')) {
          return (data['monthly-salary'] as num).toDouble();
        } else {
          return null;
        }
      });

  Future<void> setMonthlySalary(String userId, double salary) =>
      FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(userId)
          .set({'monthly-salary': salary}, SetOptions(merge: true));

  Future<void> saveBucket(String userId, Bucket bucket) =>
      FirebaseFirestore.instance.runTransaction((transaction) async {
        // final userDoc =
        //     FirebaseFirestore.instance.collection(kUsersCollection).doc(userId);
        //
        // final userData = (await transaction.get(userDoc)).data()!;
        // double? newUnallocatedSalary;
        // if (userData.containsKey('unallocated-monthly-salary')) {
        //   newUnallocatedSalary ??= userData['unallocated-monthly-salary'];
        // }
        // newUnallocatedSalary = userData['monthly-salary'];
        // newUnallocatedSalary -= bucket.targetAmount;
        //
        // transaction.set(
        //   userDoc,
        //   {'unallocated-monthly-salary': newUnallocatedSalary},
        //   SetOptions(merge: true),
        // );
      });
}
