import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minikdostum/app/siralama.dart';
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/app/drawer_widget.dart';
import 'package:minikdostum/app/isimlendir.dart';

import 'hayvanlar_listesi.dart';

class AnaSayfaWidget extends StatefulWidget {
  @override
  _AnaSayfaDrawerState createState() => _AnaSayfaDrawerState();
}

class _AnaSayfaDrawerState extends State<AnaSayfaWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void isimlendirButonu(BuildContext context) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IsimlendirWidget()));

  void siralamaButonu(BuildContext context) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SiralamaWidget()));

  @override
  Widget build(BuildContext context) {
    ThemeData(primarySwatch: Colors.purple, accentColor: Colors.cyanAccent);
    return Scaffold(
      key: _scaffoldKey,
      appBar: _getCustomAppBar(),
      drawer: DrawerState().drawerMenu(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 15),
          Text(
            "Bölgedeki Dostlarım",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22, color: Renkler.mavi, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
              height: 120,
              padding: EdgeInsets.all(5),
              child: HayvanlarListesi()),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 30, left: 30, top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Renkler.mavi,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "Dostuna Yardım Et",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Image.asset("assets/images/location-sample.jpeg"),
                SizedBox(height: 20),
                Text(
                  "Sana En Yakın Mama\n Bekleyen Dostun",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "500 Metre Uzaklıkta",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(right: 50, left: 50),
                    child: RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      onPressed: () => {},
                      child: Text(
                        'QR KOD OKUT',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: RaisedButton(
                    color: Renkler.pembe,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () => {},
                    child: Text(
                      'MAMA BAĞIŞLA',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () => this.siralamaButonu(context),
                    child: Text(
                      'SIRALAMAYI GÖR',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: RaisedButton(
                    color: Renkler.pembe,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    onPressed: () => this.isimlendirButonu(context),
                    child: Text(
                      'İSİMLENDİR',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          )
        ],
      ),
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
              "ANA  SAYFA",
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
