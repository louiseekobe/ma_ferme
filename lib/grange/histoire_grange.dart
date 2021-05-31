import 'package:flutter/material.dart';
import 'package:ma_ferme/grange/accueil_grange.dart';
import 'package:ma_ferme/grange/voir_histoireGrange.dart';

class HistoireGrange extends StatefulWidget {
  @override
  _HistoireGrangeState createState() => _HistoireGrangeState();
}

class _HistoireGrangeState extends State<HistoireGrange> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/grange/BG_grange.jpg"), fit: BoxFit.cover),
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
                        image: AssetImage("image/grange/appbarhistoireV.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return VoirHistoireGrange();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 200,
                    child: Image.asset("image/grange/histoire1.png",
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
                    return Grange();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("image/grange/retour.png",
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
