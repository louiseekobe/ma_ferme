import 'package:flutter/material.dart';
import 'package:ma_ferme/maison/accueil_maison.dart';
import 'package:ma_ferme/maison/voir_histoire.dart';

class HistoireMaison extends StatefulWidget {
  @override
  _HistoireMaisonState createState() => _HistoireMaisonState();
}

class _HistoireMaisonState extends State<HistoireMaison> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/maison/salon1.png"), fit: BoxFit.cover),
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
                        image: AssetImage("image/maison/appbarhistoire.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return VoirHistoire();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 200,
                    child: Image.asset("image/maison/histoiretitre.png",
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
                    return new Maison();
                  }));
                },
                child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("image/maison/retour.png",
                        fit: BoxFit.fill)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
