import 'package:minikdostum/models/user_model.dart';
import 'package:minikdostum/services/db_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDBService implements DBService {
  final Firestore _firestore = Firestore.instance;

  @override
  Future<bool> saveUser(User user) async {
    await _firestore
        .collection("users")
        .document(user.userID)
        .setData(user.toMap());
    return true;
  }

  @override
  Future<User> getUser(String userID) async {
    DocumentSnapshot _userData =
        await Firestore.instance.document("users/$userID").get();
    return User.fromMap(_userData.data);
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) async {
    await _firestore
        .collection("users")
        .document(userID)
        .setData(map, merge: true);
    return true;
  }

  @override
  Future<List<User>> getUserList() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection("users").getDocuments();
    return querySnapshot.documents
        .map((user) => User.fromMap(user.data))
        .toList();
  }

  @override
  Future<DateTime> getTime(String userID) async {
    await _firestore.collection("server").document(userID).setData({
      "time" : FieldValue.serverTimestamp()
    });
    var map = await _firestore.collection("server").document(userID).get();
    Timestamp time = map.data["time"];
    return time.toDate();
  }
}
