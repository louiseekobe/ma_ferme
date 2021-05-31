import 'package:flutter/material.dart';
import 'package:ma_ferme/utilitaires/utils.dart';
import 'package:ma_ferme/maison/accueil_maison.dart';

class JouerMaison extends StatefulWidget {
  @override
  _JouerMaisonState createState() => _JouerMaisonState();
}

class _JouerMaisonState extends State<JouerMaison> {
  Question question;
  Images image1;
  Images2 image2;
  List<Question> listeQuestion = [
    new Question('Où est le chien'),
    new Question('Où est le chat'),
    new Question('Où est le chat'),
    new Question('Où est la souris'),
    new Question('Où est le chien'),
  ];

  List<Images> listeImage = [
    new Images('chienOs.png', true),
    new Images('chat.png', true),
    new Images('jouer/coq.png', false),
    new Images('jouer/souris.png', true),
    new Images('jouer/lion.png', false),
  ];

  List<Images2> listeImage2 = [
    new Images2('chat.png', false),
    new Images2('chien.png', false),
    new Images2('chat6.png', true),
    new Images2('jouer/agnaux.png', false),
    new Images2('chienBal.png', true),
  ];

  int indexe = 0;
  //methode qui initialise le Scaffold de notre application
  @override
  void initState() {
    super.initState();
    question = listeQuestion[indexe];
    image1 = listeImage[indexe];
    image2 = listeImage2[indexe];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/maison/salon1.png"),
                fit: BoxFit.cover),
          ),

          //DEFINI SOUS FORME DE COLONNE TOUS LES ELEMENTS DE NOTRE PAGE
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/maison/appbarjouer.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              //DEFINIR LE CONTENEUR DE L'IMAGE
              new Container(
                  color: Colors.transparent,
                  height: 200,
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //IMAGE 1
                      GestureDetector(
                        onTap: () {
                          dialog(image1.reponse);
                        },
                        child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.transparent,
                            child: Image.asset(
                                'image/maison/' + image1.imagePath,
                                fit: BoxFit.fill)),
                      ),
                      //IMAGE 2
                      GestureDetector(
                        onTap: () {
                          dialog(image2.reponse);
                        },
                        child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.transparent,
                            child: Image.asset(
                                'image/maison/' + image2.imagePath,
                                fit: BoxFit.fill)),
                      ),
                    ],
                  )),

              //DEFINIR LE TITRE SOUS L'IMAGE
              Container(
                height: 70,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink[800], width: 5)),
                child: Center(
                  child: Text(
                    question.enonce,
                    style: TextStyle(
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              //DEFINIR LES DEUX BOUTONS POUR AVANCER OU RECULER
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  precedant(),
                  suivant(),
                ],
              ),

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
        if (indexe < listeQuestion.length - 1) {
          setState(() {
            indexe++;
            question = listeQuestion[indexe];
            image1 = listeImage[indexe];
            image2 = listeImage2[indexe];
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
            question = listeQuestion[indexe];
            image1 = listeImage[indexe];
            image2 = listeImage2[indexe];
          });
        }
      },
      child: Container(
          height: 70,
          width: 100,
          child: Image.asset("image/maison/precedant.png", fit: BoxFit.cover)),
    );
  }

//Bouton de type alert dialog
//indiquera lorsque le dessin est vrai
//ou lorsque le dessin est faux
  Future<Null> dialog(bool b) async {
    String vrai = 'image/maison/bravo.png';
    String faux = 'image/maison/dommage.png';
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new SimpleDialog(
            title: Text(
              b ? 'BRAVO' : 'DOMMAGE',
              style: TextStyle(color: b ? Colors.black : Colors.red),
              textScaleFactor: 1.4,
              textAlign: TextAlign.center,
            ),
            contentPadding: EdgeInsets.all(5.0),
            children: <Widget>[
              new Image.asset(b ? vrai : faux, fit: BoxFit.cover),
              new Container(
                height: 20.0,
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (indexe < listeQuestion.length - 1) {
                    setState(() {
                      indexe++;
                      question = listeQuestion[indexe];
                      image1 = listeImage[indexe];
                      image2 = listeImage2[indexe];
                    });
                  }
                },
                color: Colors.green[900],
                child: Text(
                  'CONTINUONS',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        });
  }
}
