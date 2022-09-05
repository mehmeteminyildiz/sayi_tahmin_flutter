import 'package:flutter/material.dart';
import 'package:sayi_tahmin/OyunEkrani.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var toggleSonDurumlar = [true, false, false];
  int seciliToggleIndex = 0;
  var tfcAd = TextEditingController();

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
                  Text(
                    "Sayı Bilmece",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ToggleButtons(
                    children: [
                      Text("Kolay"),
                      Text("Orta"),
                      Text("Zor"),
                    ],
                    isSelected: toggleSonDurumlar,
                    color: Colors.pink,
                    selectedColor: Colors.white,
                    fillColor: Colors.black,
                    onPressed: (int secilenIndex) {
                      setState(() {
                        for (var i = 0; i < toggleSonDurumlar.length; i++) {
                          if (i == secilenIndex) {
                            toggleSonDurumlar[i] = true;
                          } else {
                            toggleSonDurumlar[i] = false;
                          }
                        }
                      });
                      seciliToggleIndex = secilenIndex;
                      print("seciliToggleIndex : ${seciliToggleIndex + 1}");
                    },
                  ),
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/9/9f/2NumberTwoInCircle.png",
                    width: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: tfcAd,
                      decoration: InputDecoration(
                        labelText: "Adınız",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      var oyunSeviyesi =
                          seciliToggleIndex; // 0: kolay   1: orta   2: zor
                      var isim = tfcAd.text.toString();
                      print("oyunSeviyesi: $oyunSeviyesi\nisim: $isim");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OyunEkrani()));
                    },
                    child: Text("Başla"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                    ),
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
