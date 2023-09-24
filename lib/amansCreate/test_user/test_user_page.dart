import 'package:petition_ha/widgets/appBar.dart';

import 'test_veri.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];

  TestVeri test_1 = TestVeri();

  void butonFonksiyonu(bool secilenButon) {
    if (test_1.testBittiMi() == true) {
      //alertDialog gosterecek
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Вы закончили тест!'),
              actions: [
                IconButton(

                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      //indexi sifirla
                      test_1.testiSifirla();
                      //secimleri sifirla
                      secimler = [];
                    });

                  },

                  icon: Icon(Icons.arrow_back),
                ),
              ],
            );
          });
    } else {
      setState(() {
        test_1.getSoruYanit() == secilenButon
            ? secimler.add(kDogruIconu)
            : secimler.add(kYanlisIconu);
        test_1.sonrakiSoru();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  '${test_1.getSoruMetni()}',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            runSpacing: 3,
            spacing: 3,
            children: secimler,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        child: Text('a',style: TextStyle(fontSize: 30),),
                        onPressed: () {
                          butonFonksiyonu(false);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        child: Text('b',style: TextStyle(fontSize: 30),),
                        onPressed: () {
                          butonFonksiyonu(true);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        child: Text('c',style: TextStyle(fontSize: 30),),
                        onPressed: () {
                          butonFonksiyonu(false);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: ElevatedButton(
                        child: Text('d',style: TextStyle(fontSize: 30),),
                        onPressed: () {
                          butonFonksiyonu(true);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}