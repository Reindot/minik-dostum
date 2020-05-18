import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:minikdostum/locator.dart';
import 'package:minikdostum/models/user_model.dart';
import 'package:minikdostum/services/auth_base.dart';
import 'package:minikdostum/services/db_base.dart';
import 'package:minikdostum/services/fireabase_storage_service.dart';
import 'package:minikdostum/services/firebase_auth_service.dart';
import 'package:minikdostum/services/firebase_vision_service.dart';
import 'package:minikdostum/services/firestore_db_service.dart';
import 'package:minikdostum/services/storage_service.dart';
import 'package:minikdostum/services/vision_base.dart';

enum AuthMode { FIREBASE }
enum DBMode { FIRESTORE }
enum StorageMode { FIREBASE }

class UserRepository implements AuthService, DBService, StorageService, VisionService {
  FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();
  FirebaseStorageService _firebaseStorageService = locator<FirebaseStorageService>();
  FirestoreVisionService _firestoreVisionService = locator<FirestoreVisionService>();

  AuthMode _authMode = AuthMode.FIREBASE;
  DBMode _dbMode = DBMode.FIRESTORE;
  StorageMode _storageMode = StorageMode.FIREBASE;

  List<User> userList = [];

  @override
  Future<User> currentUser() async {
    if (_authMode == AuthMode.FIREBASE) {
      User _user = await _firebaseAuthService.currentUser();
      if (_user != null) return await _firestoreDBService.getUser(_user.userID);
    }
    return null;
  }

  @override
  Future<User> signIn(String email, String password) async {
    if (_authMode == AuthMode.FIREBASE) {
      User _user = await _firebaseAuthService.signIn(email, password);
      return await _firestoreDBService.getUser(_user.userID);
    }

    return null;
  }

  @override
  Future<bool> signOut() async {
    if (_authMode == AuthMode.FIREBASE)
      return await _firebaseAuthService.signOut();
    return false;
  }

  @override
  Future<bool> resetPassword(String email) async {
    if (_authMode == AuthMode.FIREBASE)
      return await _firebaseAuthService.resetPassword(email);
    return false;
  }

  @override
  Future<User> createUser(String email, String password) async {
    if (_authMode == AuthMode.FIREBASE) {
      User _user = await _firebaseAuthService.createUser(email, password);
      bool _value = await _firestoreDBService.saveUser(_user);
      if (_value) {
        return await _firestoreDBService.getUser(_user.userID);
      } else
        return null;
    }
    return null;
  }

  @override
  Future<User> getUser(String userID) {
    // TODO: implement getUser
    return null;
  }

  @override
  Future<bool> saveUser(User user) {
    // TODO: implement saveUser
    return null;
  }

  @override
  Future<bool> updateUser(String userID, Map<String, dynamic> map) async {
    if (_dbMode == DBMode.FIRESTORE) {
      await _firestoreDBService.updateUser(userID, map);
      return true;
    }
    return null;
  }

  @override
  Future<String> uploadProfilePhoto(String userID, File file) async {
    if (_storageMode == StorageMode.FIREBASE) {
      var url = await _firebaseStorageService.uploadProfilePhoto(userID, file);
      await _firestoreDBService.updateUser(userID, {'profileURL': url});
      return url;
    }
    return null;
  }

  @override
  Future<List<User>> getUserList() async {
    if (_dbMode == DBMode.FIRESTORE) {
      userList = await _firestoreDBService.getUserList();
      return userList;
    }
    return null;
  }

  User findUserInList(String userID) {
    for(int i = 0; i < userList.length; i++){
      if(userList[i].userID == userID){
        return userList[i];
      }
    }
    return null;
  }

  @override
  Future<DateTime> getTime(String userID) async {
    if (_dbMode == DBMode.FIRESTORE)
      return await _firestoreDBService.getTime(userID);
    return null;
  }

  @override
  Future<List<ImageLabel>> getLabels(File imageFile) {
    _firestoreVisionService.getLabels(imageFile);
    return null;
  }

  @override
  Future<String> readBarcode(File imageFile) {
    _firestoreVisionService.readBarcode(imageFile);
    return null;
  }
}
