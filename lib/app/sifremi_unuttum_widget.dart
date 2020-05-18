import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minikdostum/app/giris_yap_widget.dart';
import 'package:minikdostum/app/mail_gonderildi.widget.dart';
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/values/constants.dart';

class SifremiUnuttumWidget extends StatelessWidget {
  void geriButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => GirisYapWidget()));

  void ileriButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => MailGonderildiWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.arkaPlanMavi,
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 118,
                  height: 53,
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: FlatButton(
                    onPressed: () => this.geriButonu(context),
                    color: Renkler.mavi,
                    //       splashColor: Renkler.mavi,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/icon-back.png",
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Geri",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
                height: 400,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Şifremi Unuttum",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Renkler.mavi,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: hintKutuStili,
                      height: 60.0,
                      margin: EdgeInsets.only(right: 10, left: 10),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        style: hintTextStili,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(top: 14.0, left: 15.0),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Renkler.mavi.withOpacity(0.5),
                          ),
                          hintText: 'E-postanı Gir',
                          hintStyle: TextStyle(
                            color: Renkler.mavi.withOpacity(0.5),
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                    width: 118,
                    height: 53,
                    margin: EdgeInsets.only(top: 20, right: 20),
                    child: FlatButton(
                      color: Renkler.mavi,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/icon-forward.png",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "İleri",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => this.ileriButonu(context),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
