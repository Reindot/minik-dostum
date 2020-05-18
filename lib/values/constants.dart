import 'package:flutter/material.dart';
import 'package:minikdostum/values/colors.dart';

import 'colors.dart';

final hintTextStili = TextStyle(
    color: Renkler.mavi.withOpacity(0.5),
    fontFamily: 'OpenSans',
    fontWeight: FontWeight.bold
);

final hintKutuStili = BoxDecoration(
  color: Renkler.hintMavi,
  borderRadius: BorderRadius.circular(25.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 10.0,
      offset: Offset(0, 2),
    ),
  ],
);
