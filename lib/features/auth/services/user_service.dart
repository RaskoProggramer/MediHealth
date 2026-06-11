import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUserProfile({
    required String uid,
    required String fullname,
    required String email,
    required String password,
  }) {
    return _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'fullname': fullname,
      'email': email,
      'password': password,
      'role': 'patient',
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}