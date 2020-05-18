import 'package:flutter/material.dart';
import 'package:minikdostum/app/giris_yap_widget.dart';
import 'package:minikdostum/app/kayit_ol_widget.dart';
import 'package:minikdostum/values/colors.dart';

class HosgeldinWidget extends StatelessWidget {
  void girisYapButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => GirisYapWidget()));

  void kayitOlButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => KayitOlWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 3),
            Container(
              height: 130,
              padding: EdgeInsets.only(top: 5),
              margin: EdgeInsets.only(left: 50, right: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Renkler.mavi,
              ),
              child: Text(
                "MİNİK \nDOSTUM",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Renkler.pembe,
                  letterSpacing: 3,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
            Spacer(flex: 8),
            Container(
              height: 130,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 55,
                    child: RaisedButton(
                      color: Renkler.pembe,
                      onPressed: () => this.girisYapButonu(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "GİRİŞ YAP",
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 52,
                    child: RaisedButton(
                      color: Renkler.mavi,
                      onPressed: () => this.kayitOlButonu(context),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "KAYIT OL",
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
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
