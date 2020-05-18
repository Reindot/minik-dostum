import 'package:flutter/material.dart';
import 'package:minikdostum/app/siralama_listesi.dart';
import 'package:minikdostum/values/colors.dart';

import 'drawer_widget.dart';

class SiralamaWidget extends StatefulWidget {
  @override
  _SiralamaWidgetState createState() => _SiralamaWidgetState();
}

class _SiralamaWidgetState extends State<SiralamaWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

@override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: _getCustomAppBar(),
      drawer: DrawerState().drawerMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child:
          Container(
              height: 250,
              child: KullaniciListesi()
          ),
          ),
        ],
      )
    );
  }

  _getCustomAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
            ),
            color: Renkler.mavi),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    padding: EdgeInsets.all(20),
                    icon: Icon(
                      Icons.menu,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer()
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "SIRALAMA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
