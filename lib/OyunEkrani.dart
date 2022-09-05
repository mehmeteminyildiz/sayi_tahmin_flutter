import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin/SonucEkrani.dart';

class OyunEkrani extends StatefulWidget {
  int oyunSeviyesi;
  String isim;

  OyunEkrani(this.oyunSeviyesi, this.isim);

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  var kalanHak = 0;
  var tfcTahmin = TextEditingController();
  var ipucu = "";
  var rastgeleSayi = 0;
  int yapilan_tahmin_sayisi = 0;

  @override
  void initState() {
    super.initState();
    print("initstate");
    var gelenSeviye = widget.oyunSeviyesi;
    var gelenIsim = widget.isim;

    rastgeleSayi = Random().nextInt(100);
    print("oluşturduğumuz sayı: $rastgeleSayi");

    if (gelenSeviye == 0) {
      // kolay seviye... hak = 10 yapalım
      kalanHak = 10;
    } else if (gelenSeviye == 1) {
      // orta seviye... hak = 7 olsun
      kalanHak = 7;
    } else {
      // zor seviye
      kalanHak = 3;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          // Version Control System - VCS
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Kalan Hak: $kalanHak"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tfcTahmin,
                      decoration: InputDecoration(
                        labelText: "Tahmininiz",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int oyuncuTahmini =
                            int.parse(tfcTahmin.text.toString());
                        yapilan_tahmin_sayisi++;

                        if (oyuncuTahmini == rastgeleSayi) {
                          print("BİLDİNİZ!!");
                          setState(() {
                            kalanHak--;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SonucEkrani(
                                      true, yapilan_tahmin_sayisi)));
                        } else {
                          setState(() {
                            kalanHak--;
                            if (kalanHak <= 0) {
                              print("oyunu kaybettin");
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SonucEkrani(
                                          false, yapilan_tahmin_sayisi)));
                            }
                          });
                        }

                        print("oyuncu tahmini : $oyuncuTahmini");
                      });
                    },
                    child: Text("Tamam"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
                  ),
                  Text("$ipucu"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
