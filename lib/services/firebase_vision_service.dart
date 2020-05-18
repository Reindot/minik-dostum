import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:minikdostum/services/vision_base.dart';

class FirestoreVisionService implements VisionService {

  @override
  Future<List<ImageLabel>> getLabels(File imageFile) async{
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final ImageLabeler cloudLabeler = FirebaseVision.instance.cloudImageLabeler();
    final List<ImageLabel> cloudLabels = await cloudLabeler.processImage(visionImage);
    for (ImageLabel label in cloudLabels) {
      final String text = label.text;
      final double confidence = label.confidence;
      debugPrint("getLabels-------------------------->>>>>>> $text (c:$confidence)");
    }
  }

  @override
  Future<String> readBarcode(File imageFile) async{
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final BarcodeDetector barcodeDetector = FirebaseVision.instance.barcodeDetector();
    final List<Barcode> barcodes = await barcodeDetector.detectInImage(visionImage);
    String _rawValue = "";
    for (Barcode barcode in barcodes) {
      final String rawValue = barcode.rawValue;
      debugPrint("readBarcode-------------------------->>>>>>> $rawValue");
    }
    return _rawValue;
  }
}