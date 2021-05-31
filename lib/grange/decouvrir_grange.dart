import 'package:flutter/material.dart';
import 'package:ma_ferme/grange/accueil_grange.dart';
import 'package:ma_ferme/utilitaires/utils.dart';

//PAGE DECOUVRIR LA MAISON
class DecouvrirGrange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecouvrirGrange();
  }
}

class _DecouvrirGrange extends State<DecouvrirGrange> {
  Proposition proposition;

  List<Proposition> listProposition = [
    new Proposition('VOICI LA VACHE', 'Elle vit dans la grange', 'vache.png'),
    new Proposition('VOICI LE LAPIN', 'Il adore les carottes', 'lapin.png'),
    new Proposition(
        'VOICI LE CHEVAL', 'Tu peux faire des balades avec lui', 'cheval.png'),
    new Proposition('VOICI LE POULET', 'Il vit dans la grange avec ses enfants',
        'poulet.png'),
    new Proposition(
        'VOICI LE MOUTON', 'Il adore manger des herbes', 'mouton.png'),
    new Proposition(
        'VOICI LE POULET', 'Il reveille tout le monde le matin ', 'poulet.png'),
    new Proposition(
        'LA VACHE', 'Grace à lui tu peux avoir du lait', 'vache.png'),
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
            image: AssetImage("image/grange/BG_grange.jpg"), fit: BoxFit.cover),
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
                        image: AssetImage("image/grange/appbardecouvrir.png"),
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
                child: new Image.asset('image/grange/' + proposition.imagePath),
              ),
              SizedBox(
                height: 20,
              ),
              //Description et titre de l'image
              Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.brown, width: 5)),
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
          child: Image.asset("image/grange/suivant.png", fit: BoxFit.cover)),
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
          child: Image.asset("image/grange/precedant.png", fit: BoxFit.cover)),
    );
  }
}
