import 'package:flutter/material.dart';
import 'package:ma_ferme/etang/accueil_etang.dart';
import 'package:ma_ferme/etang/voir_histoireEtang.dart';

class HistoireEtang extends StatefulWidget {
  @override
  _HistoireEtangState createState() => _HistoireEtangState();
}

class _HistoireEtangState extends State<HistoireEtang> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/etang/etangbackground.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              //APPBAR
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/etang/histoireEtang.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return VoirHistoireEtang();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 200,
                    child: Image.asset("image/etang/histoireV.png",
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              //bouton de retour
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return Etang();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("image/etang/retour.png",
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
