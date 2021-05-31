import 'package:flutter/material.dart';
import 'package:ma_ferme/etang/decouvrir_etang.dart';
import 'package:ma_ferme/etang/jouer_etang.dart';
import 'package:ma_ferme/etang/histoire_etang.dart';
import 'package:ma_ferme/accueil.dart';

class Etang extends StatefulWidget {
  @override
  _EtangState createState() => _EtangState();
}

class _EtangState extends State<Etang> {
  @override
  Widget build(BuildContext context) {
    //PERMET DE DEFINIR UN BACKGROUNG IMAGE POUR NOTRE APPLICATION
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/etang/etangbackground.jpg"),
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
                      image: AssetImage("image/etang/etang.png"),
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
                  return new DecouvrirEtang();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/etang/menu_decouvrir.png",
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
                  return new JouerEtang();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/etang/menu_jouer.png",
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
                  return new HistoireEtang();
                }));
              },
              child: Container(
                  height: 100,
                  width: 170,
                  child: Image.asset("image/etang/menu_histoire.png",
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
                      Image.asset("image/etang/retour.png", fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
    );
  }
}
