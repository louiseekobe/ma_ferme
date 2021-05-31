import 'package:flutter/material.dart';
import 'package:ma_ferme/grange/histoire_grange.dart';
import 'package:ma_ferme/grange/decouvrir_grange.dart';
import 'package:ma_ferme/grange/jouer_grange.dart';
import 'package:ma_ferme/accueil.dart';

class Grange extends StatefulWidget {
  @override
  _GrangeState createState() => _GrangeState();
}

class _GrangeState extends State<Grange> {
  @override
  Widget build(BuildContext context) {
    //PERMET DE DEFINIR UN BACKGROUNG IMAGE POUR NOTRE APPLICATION
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/grange/BG_grange.jpg"),
            fit: BoxFit.fitHeight),
      ),
      child: SingleChildScrollView(
        //DEFINI SOUS FORME DE COLONNE TOUS LES ELEMENTS DE NOTRE PAGE
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //IMAGE QUI  FERA OFFICE DE APPBAR
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("image/grange/grange.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),

            //DEFINIR LE BOUTON DECOUVRIR
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new DecouvrirGrange();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/grange/decouvrir_grange.png",
                      fit: BoxFit.fill)),
            ),

            SizedBox(
              height: 30,
            ),

            //PERMET DE DEFINIR LE BOUTON JOUER
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new JouerGrange();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/grange/jouer_grange.png",
                      fit: BoxFit.fill)),
            ),

            SizedBox(
              height: 30,
            ),

            //PERMET DE DEFINIR LE BOUTON HISTOIRE
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new HistoireGrange();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/grange/histoire_grange.png",
                      fit: BoxFit.fill)),
            ),

            SizedBox(
              height: 30,
            ),

            //PERMET DE DEFINIR LE BOUTON RETOUR VERS LE MENU PRINCIPAL
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new Accueil();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child:
                      Image.asset("image/grange/retour.png", fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
    );
  }
}
