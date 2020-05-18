import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:minikdostum/values/colors.dart';
import 'package:minikdostum/values/constants.dart';

class DostlarimListesi extends StatelessWidget {
  List<dost> tumDostlarim = [];

  @override
  Widget build(BuildContext context) {
    DostlarimVeri();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: tumDostlarim.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(10),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        color: Colors.white,
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            // Kullanıcıya ait Profil Fotoğrafıdır. Veri databaseden çekilecektir.
            radius: 30,
            backgroundImage:
            NetworkImage(tumDostlarim[index]._profilFotografi),
          ),
          title: Text(
            tumDostlarim[index]._isim,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Renkler.mavi),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(tumDostlarim[index]._mahalle,textAlign: TextAlign.start,style: hintTextStili,),
          onTap: () {},
        ),
      ),
    );
  }

  void DostlarimVeri() {
    tumDostlarim = [
      dost("Cesur",
          "https://cdn4.vectorstock.com/i/1000x1000/23/18/cute-dog-kawaii-style-vector-13352318.jpg",
          "Mehmet Akif Mahallesi"),
      dost("Puffy",
          "https://cdn2.vectorstock.com/i/1000x1000/85/76/cat-flat-icon-for-web-and-mobile-vector-14448576.jpg",
          "Kayaş"),
      dost("Mırmır",
          "https://cdn2.vectorstock.com/i/1000x1000/85/76/cat-flat-icon-for-web-and-mobile-vector-14448576.jpg",
          "Altınevler Mahallesi"),

    ]; // isim ve pozisyon değişkenleri databaseden veri olarak alınacak. Bu sadece örnektir.
    //Verilerin Çekileceği method ögrenciVeri() dir.
  }
}

class dost {
  String _isim;
  String _profilFotografi;
  String _mahalle;

  dost(this._isim, this._profilFotografi, this._mahalle);
}
