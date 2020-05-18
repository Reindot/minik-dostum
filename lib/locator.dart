import 'package:minikdostum/repository/user_repository.dart';
import 'package:minikdostum/services/fireabase_storage_service.dart';
import 'package:minikdostum/services/firebase_auth_service.dart';
import 'package:minikdostum/services/firebase_vision_service.dart';
import 'package:minikdostum/services/firestore_db_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => FirebaseAuthService());
  locator.registerLazySingleton(() => FirestoreDBService());
  locator.registerLazySingleton(() => FirebaseStorageService());
  locator.registerLazySingleton(() => FirestoreVisionService());
  locator.registerLazySingleton(() => UserRepository());
}