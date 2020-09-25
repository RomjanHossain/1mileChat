import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CurdServide {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

// update user data
  Future<void> updateUserData(User user) async {
    final DocumentSnapshot reportRef =
        await _db.collection('Users').doc(user.uid).get();
    if (reportRef.exists) {
      return reportRef.reference.update(
        {
          'uid': user.uid,
          'email': 'romjan11@gmail.com',
          'friendsCount': 11,
          'isAdmin': false,
          'postCount': 4,
          'userName': user.displayName,
        },
      );
    }
  }

  // get user data
  Future<void> getUserData(User user) async {
    DocumentSnapshot resultUser =
        await _db.collection('Users').doc(user.uid).get();
    print(resultUser.exists);
    print(resultUser.data());
    print(resultUser.id);
  }

// delete user data
  Future<void> deleteUserData(User user) async {
    final DocumentSnapshot reportRef =
        await _db.collection('Users').doc(user.uid).get();
    if (reportRef.exists) {
      return reportRef.reference.delete();
    }
  }

  Future<void> searchuser(String data) async {
    final QuerySnapshot reportRef = await _db
        .collection('Users')
        .where('displayname', isGreaterThanOrEqualTo: data)
        .get();
    return reportRef;
  }

// get all users
  Future<void> getUsers() async {
    final QuerySnapshot resultUser = await _db.collection('Users').get();
    resultUser.docs.forEach((element) {
      print(element.data());
      print(element.exists);
      print(element.metadata);
    });
  }
}
