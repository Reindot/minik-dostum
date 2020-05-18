import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:minikdostum/app/anasayfa_widget.dart';
import 'package:minikdostum/app/kayit_ol_widget.dart';
import 'package:minikdostum/app/sifremi_unuttum_widget.dart';
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/values/constants.dart';

class GirisYapWidget extends StatefulWidget {
  @override
  _GirisYapState createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYapWidget> {
  bool _rememberMe = true;

  void sifremiUnuttumButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SifremiUnuttumWidget()));

  void kayitOlButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => KayitOlWidget()));

  void girisButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => AnaSayfaWidget()));

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
                  color: Renkler.mavi,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () {},
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
                  color: Renkler.mavi.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  onPressed: () => this.kayitOlButonu(context),
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
            SizedBox(height: 50.0),
            _buildEmailTF(),
            SizedBox(height: 30.0),
            _buildPasswordTF(),
            SizedBox(height: 20.0),
            _buildRememberMeCheckbox(),
            SizedBox(
              height: 20.0,
            ),
            _buildLoginBtn(context),
            _buildForgotPasswordBtn(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
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

  Widget _buildPasswordTF() {
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

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => this.sifremiUnuttumButonu(context),
        child: Text(
          'Şifremi Unuttum',
          style: TextStyle(
            color: Renkler.mavi,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data:
                ThemeData(unselectedWidgetColor: Renkler.mavi.withOpacity(0.5)),
            child: Checkbox(
              value: _rememberMe,
              activeColor: Renkler.mavi.withOpacity(0.5),
              checkColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Beni Hatırla',
            style: hintTextStili,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(15.0),
        color: Renkler.mavi,
        onPressed: () => this.girisButonu(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'GİRİŞ',
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
