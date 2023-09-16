
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/models/user.dart';
import 'package:dating_app/respositories/baseloadusersrepo.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Usersdata extends BaseUsersRepo {
  final FirebaseFirestore _firestore;

  Usersdata({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<User>> getUsers() {
    var user = auth.FirebaseAuth.instance.currentUser;
    return _firestore
        .collection('users')
        .where('email', isNotEqualTo: user!.email)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return User.fromSnapshot(doc);
      }).toList();
    });
  }
}
