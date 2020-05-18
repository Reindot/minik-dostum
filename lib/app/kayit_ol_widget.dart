import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minikdostum/app/kayit_alindi_widget.dart';
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/values/constants.dart';

import 'giris_yap_widget.dart';

class KayitOlWidget extends StatefulWidget {
  @override
  _KayitOlState createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOlWidget> {
  void girisYapButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => GirisYapWidget()));

  void kayitOlButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => KayitAlindiWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 40, right: 35, left: 35),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Renkler.mavi.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () => this.girisYapButonu(context),
                  child: Text(
                    '   Giriş Yap   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Renkler.mavi,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () {},
                  child: Text(
                    '   Kayıt Ol   ',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            _isimMethodu(),
            SizedBox(height: 30.0),
            _epostaMethodu(),
            SizedBox(height: 30.0),
            _sifreMethodu(),
            SizedBox(height: 30.0),
            _ilMethodu(),
            SizedBox(height: 30.0),
            _ilceMethodu(),
            SizedBox(height: 30.0),
            _kayitOlMethodu(context),
          ],
        ),
      ),
    );
  }

  Widget _isimMethodu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: hintKutuStili,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: hintTextStili,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Renkler.mavi.withOpacity(0.5),
                ),
                hintText: 'Adını / Soyadını Gir',
                hintStyle: hintTextStili),
          ),
        ),
      ],
    );
  }

  Widget _epostaMethodu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: hintKutuStili,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: hintTextStili,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Renkler.mavi.withOpacity(0.5),
                ),
                hintText: 'E-postanı Gir',
                hintStyle: hintTextStili),
          ),
        ),
      ],
    );
  }

  Widget _sifreMethodu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: hintKutuStili,
          height: 50.0,
          child: TextField(
            style: hintTextStili,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Renkler.mavi.withOpacity(0.5),
              ),
              hintText: 'Şifreni Gir',
              hintStyle: hintTextStili,
            ),
          ),
        ),
      ],
    );
  }

  Widget _ilMethodu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: hintKutuStili,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.text,
            style: hintTextStili,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Renkler.mavi.withOpacity(0.5),
                ),
                hintText: 'İlini Gir',
                hintStyle: hintTextStili),
          ),
        ),
      ],
    );
  }

  Widget _ilceMethodu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: hintKutuStili,
          height: 50.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: hintTextStili,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.home,
                  color: Renkler.mavi.withOpacity(0.5),
                ),
                hintText: 'İlçeni Gir',
                hintStyle: hintTextStili),
          ),
        ),
      ],
    );
  }

  Widget _kayitOlMethodu(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: Renkler.mavi,
        onPressed: () => this.kayitOlButonu(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'KAYIT OL',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}
