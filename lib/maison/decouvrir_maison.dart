import 'package:flutter/material.dart';
import 'package:ma_ferme/utilitaires/utils.dart';
import 'package:ma_ferme/maison/accueil_maison.dart';

//PAGE DECOUVRIR LA MAISON
class DecouvrirMaison extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecouvrirMaison();
  }
}

class _DecouvrirMaison extends State<DecouvrirMaison> {
  Proposition proposition;

  List<Proposition> listProposition = [
    new Proposition('VOICI LE CHIEN', 'Il vit dans la maison', 'chien.png'),
    new Proposition('VOICI LE CHIEN', 'Il adore les os', 'chienOs.png'),
    new Proposition(
        'VOICI LE CHIEN', 'Il aime jouer avec la balle', 'chienBal.png'),
    new Proposition('VOICI LE CHAT', 'Il vit dans la maison', 'chat.png'),
    new Proposition('VOICI LE CHAT', 'Il adore manger le poisson', 'chat6.png'),
    new Proposition('VOICI LE CHAT', 'Il chasse les souris', 'chatsouris.png'),
    new Proposition(
        'LE CHAT', 'Il joue avec les boule de laine', 'chatLaine.png'),
  ];

  int indexe = 0;

  //INITIALISER LA FONCTION
  @override
  void initState() {
    super.initState();
    proposition = listProposition[indexe];
  }

  //CONSTRUIRE LE CONTEXT
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.50;
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/maison/salon1.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          //DEFINI SOUS FORME DE COLONNE TOUS LES ELEMENTS DE NOTRE PAGE
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/maison/appbardecouvrir.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //DEFINIR LE CONTENEUR DE L'IMAGE
              new Container(
                color: Colors.transparent,
                height: size,
                width: size,
                child: new Image.asset('image/maison/' + proposition.imagePath),
              ),
              SizedBox(
                height: 20,
              ),

              //DEFINIR LE TITRE SOUS L'IMAGE
              Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink[800], width: 5)),
                child: Center(
                  child: Text(
                    proposition.enonce + "\n" + proposition.explication,
                    style: TextStyle(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              //DEFINIR LES DEUX BOUTONS POUR AVANCER OU RECULER
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  precedant(),
                  suivant(),
                ],
              ),
              SizedBox(
                height: 20,
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

  //BOUTON LA PHOTO SUIVANTE
  suivant() {
    return GestureDetector(
      onTap: () {
        //UPDATE INDEXE DE LA FONCTION
        if (indexe < listProposition.length - 1) {
          setState(() {
            indexe++;
            proposition = listProposition[indexe];
          });
        }
      },
      child: Container(
          height: 70,
          width: 100,
          child: Image.asset("image/maison/suivant.png", fit: BoxFit.cover)),
    );
  }

  //BOUTON LA PHOTO PRECEDANTE
  precedant() {
    return GestureDetector(
      onTap: () {
        //UPDATE INDEXE DE LA FONCTION
        if (indexe > 0) {
          setState(() {
            indexe--;
            proposition = listProposition[indexe];
          });
        }
      },
      child: Container(
          height: 70,
          width: 100,
          child: Image.asset("image/maison/precedant.png", fit: BoxFit.cover)),
    );
  }
}
