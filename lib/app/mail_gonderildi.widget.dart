import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minikdostum/app/giris_yap_widget.dart';
import 'package:minikdostum/values/colors.dart';

class MailGonderildiWidget extends StatelessWidget {
  void ileriButonu(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => GirisYapWidget()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Renkler.arkaPlanMavi,
      body: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.only(top: 10, bottom: 30),
        child: ListView(
          children: <Widget>[
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
                    Image.asset("assets/images/sentmail-icon.png"),
                    SizedBox(height: 40),
                    Text(
                      "E-postanıza Sıfırlama \nBilgileri Gönderildi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Renkler.mavi,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
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
