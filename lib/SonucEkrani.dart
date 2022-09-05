import 'package:flutter/material.dart';
import 'package:sayi_tahmin/main.dart';

class SonucEkrani extends StatefulWidget {
  bool kazandiMi;
  int tahmin_sayisi;

  SonucEkrani(this.kazandiMi, this.tahmin_sayisi);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  var sonuc = "";

  @override
  void initState() {
    super.initState();
    if (widget.kazandiMi) {
      sonuc = "Kazandınız!!";
    } else if (widget.kazandiMi == false) {
      sonuc = "Kaybettiniz";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("$sonuc"),
                  Text("${widget.tahmin_sayisi} tahminde bildiniz!"),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
                    child: Text("Tekrar Oyna"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
