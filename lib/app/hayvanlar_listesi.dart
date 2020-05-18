import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class HayvanlarListesi extends StatelessWidget {
  List<Hayvanlar> tumHayvanlar = [];

  Widget build(BuildContext context) {
    baglantiVeri();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tumHayvanlar.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Card(
                      margin: EdgeInsets.only(left: 40, right: 40),
                      elevation: 0,
                      color: Colors.white.withOpacity(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(tumHayvanlar[index]._photo),
                          ),
                          Text(
                            tumHayvanlar[index]._isim,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'OpenSans',
                              fontSize: 15
                            ),
                          ),
                          Text(tumHayvanlar[index]._sahip,
                              textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 12,
                          ),)
                        ],
                      )),
                ),
              ],
            ));
  }

  void baglantiVeri() {
    tumHayvanlar = [
      Hayvanlar(
          "https://cizmelikedi.com.tr/wp-content/uploads/2016/05/sokak-kedileri.jpg",
          "Cesur",
          "Ediz Mete Kurt\nİsimlendirdi."),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504712679-59b017e768b4b.jpeg",
          "İSİMSİZ",
          ""),
      Hayvanlar(
          "https://cf.kizlarsoruyor.com/a80938/b9e5107b-84b6-40ee-bfbe-3a6eb5f8b351-m.jpg",
          "İSİMSİZ",
          ""),
      Hayvanlar(
          "https://www.kedilikler.com/wp-content/uploads/2018/12/2017-rescued-stray-cat.jpg",
          "Boncuk",
          "Raşit Aydın\nİsimlendirdi."),
      Hayvanlar(
          "https://img.petsbook.com/r/900x0/uploads/announcements/1504713459-59b01af3bba18.jpeg",
          "Pulsar",
          "Yiğit Can Tekgöz\nİsimlendirdi."),
      Hayvanlar(
          "https://www.petcim.com/pictures_ilan/thumb_47a3aee52fd541fa75d91ddd84064714.jpg",
          "Duman",
          "Enes Kaçan\nİsimlendirdi.")
    ];
  }
}

class Hayvanlar {
  String _photo;
  String _isim;
  String _sahip;

  Hayvanlar(this._photo, this._isim, this._sahip);
}
