import 'dart:io';

import 'package:minikdostum/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService implements StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  StorageReference _storageReference;

  @override
  Future<String> uploadProfilePhoto(String userID, File file) async {
    _storageReference = _firebaseStorage.ref().child("profile-photos/$userID");
    var uploadTask = _storageReference.putFile(file);
    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    return url.toString().replaceFirst(userID, "${userID}_500x500");
  }
}
