import 'package:flutter/material.dart';
import 'package:ma_ferme/etang/accueil_etang.dart';
import 'package:ma_ferme/utilitaires/utils.dart';
//import 'package:ma_ferme/grange/accueil_grange.dart';

//PAGE DECOUVRIR LA MAISON
class DecouvrirEtang extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DecouvrirEtang();
  }
}

class _DecouvrirEtang extends State<DecouvrirEtang> {
  Proposition proposition;

  List<Proposition> listProposition = [
    new Proposition(
        'VOICI LE CANNARD',
        "Il vit dans l'étang et il marche toujours avec ses petits derrière lui",
        'cannard2.png'),
    new Proposition(
        'VOICI LA GRENOUILLE',
        "Elle vit dans l'étang, elle saute pour se déplacer et se nourrit d'insectes",
        'grenouille2_choix.png'),
    new Proposition(
        'VOICI LE HERON',
        "Elle vit dans l'étang, elle vole lentement avec le cou replié et se nourrit de poisson,de grenouille et souvent d'insecte",
        'heronfun.png'),
    new Proposition(
        'VOICI LA MOUSTIQUE',
        "elle vit dans l'etang, elle vole et se nourrit de nectar et du jus sucré des fleurs",
        'moustique_choix.png'),
    new Proposition(
        'VOICI LE POISSON',
        "Il vit dans l'étang, il nage et se nourrit de larve de moustique, d'algues et les lentilles d'eau",
        'poisson2_choix.png'),
    new Proposition(
        'VOICI LA TORTUE',
        "Elle vit dans l'étang, elle se cache dans la végétation aquatique et se nourrit de plantes, d'insectes et d'escargot, ",
        'tortue1_choix.png'),
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
            image: AssetImage("image/etang/etangbackground.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          //DEFINI SOUS FORME DE COLONNE TOUS LES ELEMENTS DE NOTRE PAGE
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/etang/decouvrir_etang.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              //DEFINIR LE CONTENEUR DE L'IMAGE
              new Container(
                color: Colors.transparent,
                height: size,
                width: size,
                child: new Image.asset('image/etang/' + proposition.imagePath),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              //titre et description
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 5)),
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
                height: MediaQuery.of(context).size.height * 0.020,
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
                height: MediaQuery.of(context).size.height * 0.020,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return Etang();
                  }));
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
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
          child:
              Image.asset("image/etang/suivant_true.png", fit: BoxFit.cover)),
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
          child:
              Image.asset("image/etang/precedent_true.png", fit: BoxFit.cover)),
    );
  }
}
