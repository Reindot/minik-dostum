import 'package:flutter/cupertino.dart';

enum UserTypes {MOD, STUDENT, MENTOR}

class User {
  final String userID;
  final String email;
  String profileURL;
  String name;
  String city;
  String district;

  User({@required this.userID, @required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email' : email,
      'profileURL' :profileURL ?? 'https://firebasestorage.googleapis.com/v0/b/minikdostum-01.appspot.com/o/profile-photos%2Fdefault.jpg?alt=media&token=7b51d2e6-5e86-45ba-b6a3-885cbff8205e',
      'name' : name ?? 'Raşit Aydın',
      'city' : city ?? 'Ankara',
      'district' : district ?? 'Mamak',
    };
  }

  User.fromMap(Map<String, dynamic> map):
        userID = map['userID'],
        email = map['email'],
        profileURL = map['profileURL'],
        name = map['name'],
        city = map['city'],
        district = map['district'];

}
