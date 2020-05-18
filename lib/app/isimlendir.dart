import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/app/drawer_widget.dart';

import 'hayvanlar_listesi.dart';

class IsimlendirWidget extends StatefulWidget {
  @override
  _IsimlendirWidgetState createState() => _IsimlendirWidgetState();
}

class _IsimlendirWidgetState extends State<IsimlendirWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Hayvanlar> tumHayvanlar = [];

  @override
  Widget build(BuildContext context) {
    baglantiVeri();
    ThemeData(primarySwatch: Colors.purple, accentColor: Colors.cyanAccent);
    return Scaffold(
      key: _scaffoldKey,
      appBar: _getCustomAppBar(),
      drawer: DrawerState().drawerMenu(context),
      body: GridView.builder(
        itemCount: tumHayvanlar.length,
        padding: EdgeInsets.only(right: 20, left: 20, top: 40),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.only(left: 10, right: 10),
              elevation: 0,
              color: Colors.white.withOpacity(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                 child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(tumHayvanlar[index]._photo),
                  ),),
                  Text(
                    tumHayvanlar[index]._bolge,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                        fontSize: 15
                    ),
                  ),
                ],
              )
          );
        },
      )
    );
  }
  void baglantiVeri() {
    tumHayvanlar = [
      Hayvanlar(
          "https://cizmelikedi.com.tr/wp-content/uploads/2016/05/sokak-kedileri.jpg",
          "Mehmet Akif Mahallesi 3. Bölge"),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504712679-59b017e768b4b.jpeg",
          "Mehmet Akif Mahallesi 1. Bölge"),
      Hayvanlar(
          "https://cf.kizlarsoruyor.com/a80938/b9e5107b-84b6-40ee-bfbe-3a6eb5f8b351-m.jpg",
          "Kayaş 4. Bölge"),
      Hayvanlar(
          "https://www.kedilikler.com/wp-content/uploads/2018/12/2017-rescued-stray-cat.jpg",
          "Kayaş 2. Bölge"),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504713459-59b01af3bba18.jpeg",
          "Mehmet Akif Mahallesi 2. Bölge"),
      Hayvanlar(
          "https://www.petcim.com/pictures_ilan/thumb_47a3aee52fd541fa75d91ddd84064714.jpg",
          "Kayaş 1. Bölge"),
      Hayvanlar(
          "https://cizmelikedi.com.tr/wp-content/uploads/2016/05/sokak-kedileri.jpg",
          "Mehmet Akif Mahallesi 3. Bölge"),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504712679-59b017e768b4b.jpeg",
          "Mehmet Akif Mahallesi 1. Bölge"),
      Hayvanlar(
          "https://cf.kizlarsoruyor.com/a80938/b9e5107b-84b6-40ee-bfbe-3a6eb5f8b351-m.jpg",
          "Kayaş 4. Bölge"),
      Hayvanlar(
          "https://www.kedilikler.com/wp-content/uploads/2018/12/2017-rescued-stray-cat.jpg",
          "Kayaş 2. Bölge"),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504713459-59b01af3bba18.jpeg",
          "Mehmet Akif Mahallesi 2. Bölge"),
      Hayvanlar(
          "https://www.petcim.com/pictures_ilan/thumb_47a3aee52fd541fa75d91ddd84064714.jpg",
          "Kayaş 1. Bölge")
    ];
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
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                )
              ],

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Text(
              "İSİMLENDİR",
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


class Hayvanlar {
  String _photo;
  String _bolge;

  Hayvanlar(this._photo, this._bolge);
}
