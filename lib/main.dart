import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ma_ferme/accueil.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animaux de la ferme',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

AudioPlayer player = AudioPlayer();

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setAsset('audio/splash.mp3');
    playSound();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }

  void playSound() {
    player.play();
    //player.setLoopMode(LoopMode.one);
    //player.setVolume(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 9,
      navigateAfterSeconds: new Accueil(),
      backgroundColor: Colors.white,
      title: new Text(
        'MA FERME',
        textScaleFactor: 3,
        style: TextStyle(color: Colors.white),
      ),
      image: new Image.asset(
        'image/accueil/spash.png',
        fit: BoxFit.contain,
      ),
      loadingText: Text(
        "MA FERME",
        style: TextStyle(
            color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      photoSize: 180.0,
      loaderColor: Colors.green,
    );
  }
}
