import 'package:minikdostum/app/hosgeldin_widget.dart';
import 'package:minikdostum/locator.dart';
import 'package:minikdostum/viewmodels/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => UserModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HosgeldinWidget(),
        ));
  }
}
