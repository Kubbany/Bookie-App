import 'package:booki/core/services/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<List<Map<String, dynamic>>> getData(String path) async {
    final QuerySnapshot querySnapshot = await firestore.collection(path).get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  @override
  Future<Map<String, dynamic>?> getDataById(String path, String id) async {
    final DocumentSnapshot doc = await firestore.collection(path).doc(id).get();
    if (doc.exists) {
      return doc.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  @override
  Future<void> editData(String path, String id, Map<String, dynamic> data) async {
    await firestore.collection(path).doc(id).update(data);
  }
}
