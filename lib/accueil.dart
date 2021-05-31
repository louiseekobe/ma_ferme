import 'package:flutter/material.dart';
import 'package:ma_ferme/etang/accueil_etang.dart';
import 'package:ma_ferme/grange/accueil_grange.dart';
import 'package:ma_ferme/maison/accueil_maison.dart';
import 'package:just_audio/just_audio.dart';

class Accueil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Accueil();
  }
}

AudioPlayer player = AudioPlayer();

class _Accueil extends State<Accueil> {
  @override
  void initState() {
    super.initState();
    player.setAsset('audio/songPrincipal.mp3');
    playSound();
  }

  @override
  void dispose() {
    super.dispose();
    //player.dispose();
  }

//fonction pour jouer le song
  void playSound() {
    player.play();
    player.setLoopMode(LoopMode.one);
    player.setVolume(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/accueil/herbe.png"), fit: BoxFit.cover),
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //PRESENTATION DU MENU PRINCIPAL
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("image/accueil/appbarAccueil.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),

              //AllER AU SOUS-MENU MAISON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      player.stop();
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return Maison();
                      }));
                    },
                    child: Container(
                        height: 100,
                        width: 170,
                        child: Image.asset("image/accueil/maison1.png",
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 190,
                    width: 200,
                    child: Image.asset(
                      'image/accueil/maison.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),

              //  ALLER AU SOUS-MENU GRANGE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                    height: 190,
                    width: 200,
                    child: Image.asset(
                      'image/accueil/grange.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      player.stop();
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return Grange();
                      }));
                    },
                    child: Container(
                        height: 100,
                        width: 170,
                        child: Image.asset("image/accueil/grange2.png",
                            fit: BoxFit.fill)),
                  ),
                ],
              ),

              //ALLER AU SOUS-MENU ETANG
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      player.stop();
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return Etang();
                      }));
                    },
                    child: Container(
                        height: 100,
                        width: 170,
                        child: Image.asset("image/accueil/etang.png",
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'image/accueil/etang2.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
