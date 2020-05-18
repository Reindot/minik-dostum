import 'package:minikdostum/models/user_model.dart';

abstract class DBService {
  Future<bool> saveUser(User user);
  Future<User> getUser(String userID);
  Future<bool> updateUser(String userID, Map<String, dynamic> map);
  Future<List<User>> getUserList();
  Future<DateTime> getTime(String userID);

}