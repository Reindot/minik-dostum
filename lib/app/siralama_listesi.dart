import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class KullaniciListesi extends StatelessWidget {
  List<kullanici> tumKullanicilar = [];

  @override
  Widget build(BuildContext context) {
    KullaniciVeri();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: tumKullanicilar.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(10),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        color: index % 2 == 0 ? Colors.pink.shade600 : Colors.blue.shade900,
        elevation: 10,
        child: ListTile(
          contentPadding: EdgeInsets.all(7),
          leading: Text( "    "+
            tumKullanicilar[index]._siralama.toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          title: Text(
            tumKullanicilar[index]._isim,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(tumKullanicilar[index]._puan,textAlign: TextAlign.start,style: TextStyle(color: Colors.grey.shade400),),
          trailing: CircleAvatar(
            // Kullanıcıya ait Profil Fotoğrafıdır. Veri databaseden çekilecektir.
            radius: 30,
            backgroundImage:
                NetworkImage(tumKullanicilar[index]._profilFotografi),
          ),
          onTap: () {},
        ),
      ),
    );
  }

  void KullaniciVeri() {
    tumKullanicilar = [
      kullanici(
          "Raşit Aydın (Ben) ",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "10 Puan",
          326),
      kullanici(
          "Ediz Kurt",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "80 Puan",
          1),
      kullanici(
          "Ceren Türkarslan",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "70 Puan",
          2),
      kullanici(
          "Enes Kaçan",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "60 Puan",
          3),
      kullanici(
          "Gizem Yıldız",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "50 Puan",
          4),
      kullanici(
          "Yiğit Tekgöz",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "40 Puan",
          5),
      kullanici(
          "Ahmet Soran",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "35 Puan",
          6),
      kullanici(
          "Salih Kuyumcu",
          "https://cdn1.vectorstock.com/i/1000x1000/77/30/default-avatar-profile-icon-grey-photo-placeholder-vector-17317730.jpg",
          "30 Puan",
          7),
    ]; // isim ve pozisyon değişkenleri databaseden veri olarak alınacak. Bu sadece örnektir.
    //Verilerin Çekileceği method ögrenciVeri() dir.
  }
}

class kullanici {
  String _isim;
  String _profilFotografi;
  int _siralama;
  String _puan;

  kullanici(this._isim, this._profilFotografi, this._puan, this._siralama);
}
