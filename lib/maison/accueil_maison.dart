import 'package:flutter/material.dart';
import 'package:ma_ferme/maison/histoire_maison.dart';
import 'package:ma_ferme/maison/decouvrir_maison.dart';
import 'package:ma_ferme/maison/jouer_maison.dart';
import 'package:ma_ferme/accueil.dart';

class Maison extends StatefulWidget {
  @override
  _MaisonState createState() => _MaisonState();
}

class _MaisonState extends State<Maison> {
  //creer un theme song pour chaque menu
  @override
  Widget build(BuildContext context) {
    //PERMET DE DEFINIR UN BACKGROUNG IMAGE POUR NOTRE APPLICATION
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/maison/salon1.png"),
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
                      image: AssetImage("image/maison/maison.png"),
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
                  return new DecouvrirMaison();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/maison/decouvrir_maison.png",
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
                  return new JouerMaison();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/maison/jouer_maison.png",
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
                  return new HistoireMaison();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/maison/histoire_maison.png",
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
                      Image.asset("image/maison/retour.png", fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
    );
  }
}
