import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

abstract class VisionService {
  Future<List<ImageLabel>> getLabels(File imageFile);
  Future<String> readBarcode(File imageFile);

}