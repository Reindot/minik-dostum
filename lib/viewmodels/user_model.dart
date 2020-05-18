import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:minikdostum/locator.dart';
import 'package:minikdostum/models/user_model.dart';
import 'package:minikdostum/repository/user_repository.dart';
import 'package:minikdostum/services/auth_base.dart';
import 'package:minikdostum/services/db_base.dart';
import 'package:minikdostum/services/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:minikdostum/services/vision_base.dart';

enum ViewState { IDLE, BUSY }

class UserModel with ChangeNotifier implements AuthService, DBService, StorageService, VisionService {
  ViewState _state = ViewState.IDLE;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;

  ViewState get state => _state;
  User get user => _user;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserModel() {
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.currentUser();
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.signIn(email, password);
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.BUSY;
      bool value = await _userRepository.signOut();
      _user = null;
      return value;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      state = ViewState.BUSY;
      bool value = await _userRepository.resetPassword(email);
      _user = null;
      return value;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<User> createUser(String email, String password) async {
    try {
      state = ViewState.BUSY;
      _user = await _userRepository.createUser(email, password);
      return _user;
    } finally {
      _state = ViewState.IDLE;
    }
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
    try {
      state = ViewState.BUSY;
      await _userRepository.updateUser(userID, map);
      return true;
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<String> uploadProfilePhoto(String userID, File file) async {
    try {
      state = ViewState.BUSY;
      return await _userRepository.uploadProfilePhoto(userID, file);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<List<User>> getUserList() async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.getUserList();
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<DateTime> getTime(String userID) async {
    try {
      state = ViewState.BUSY;
      return await _userRepository.getTime(userID);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<List<ImageLabel>> getLabels(File imageFile) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.getLabels(imageFile);
    } finally {
      _state = ViewState.IDLE;
    }
  }

  @override
  Future<String> readBarcode(File imageFile) async{
    try {
      state = ViewState.BUSY;
      return await _userRepository.readBarcode(imageFile);
    } finally {
      _state = ViewState.IDLE;
    }
  }

}
