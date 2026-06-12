import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/medication_model.dart';

class MedicationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser!.uid;

  Future<void> addMedication(Medication med) async {
    await _firestore
        .collection('users')
        .doc(_uid)
        .collection('medications')
        .add(med.toMap());
  }

  Stream<List<Medication>> getMedications(){
    return _firestore
          .collection('users')
          .doc(_uid)
          .collection('medications')
          .snapshots()
          .map((snapshot){
        return snapshot.docs.map((doc){
          return Medication.fromMap(doc.data(), doc.id);
        }).toList();
      });
    }

  Future<void> deleteMedication(String id) async{
    await _firestore
        .collection('users')
        .doc(_uid)
        .collection('medications')
        .doc(id)
        .delete();
  }
}