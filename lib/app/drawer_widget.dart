import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minikdostum/app/anasayfa_widget.dart';
import 'package:minikdostum/app/isimlendir.dart';
import 'package:minikdostum/app/profil_widget.dart';
import 'package:minikdostum/app/siralama.dart';

class DrawerState {

  void profilButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfilWidget()));

  Widget drawerMenu(BuildContext context) {
    return ClipPath(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(90),
          )),
      width: 300,
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            onDetailsPressed: () => this.profilButonu(context),
            accountName: Text(
              "    " + "Raşit Aydın",
              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "     " + "kprathap23@gmail.com",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  topRight: Radius.circular(90)),
              image: DecorationImage(
                image: AssetImage('assets/images/header_background.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), BlendMode.dstATop),
              ),
            ),
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/46.jpg")),
          ),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.home),
              title: Text("Ana Sayfa"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AnaSayfaWidget()));
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.person_outline),
              title: Text("Profil"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilWidget()));
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.message),
              title: Text("İsimlendir"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => IsimlendirWidget()));
              }),
          Container(
            padding: EdgeInsets.only(right: 20, left: 10),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(120)),
              child: ListTile(
                  contentPadding: EdgeInsets.only(left: 20),
                  leading: Icon(
                    Icons.star_border,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Sıralama",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SiralamaWidget()));
                  }),
            ),
          ),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.code),
              title: Text("QR Kod Okut"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(left: 30),
              leading: Icon(Icons.info),
              title: Text("S.S.S"),
              onTap: () {
                Navigator.pop(context);
              }),
          Divider(),
          ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 15),
              leading: Icon(Icons.settings),
              title: Text("Ayarlar"),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
              contentPadding: EdgeInsets.only(top: 10, left: 15),
              leading: Icon(Icons.power_settings_new),
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    ));
  }
}
