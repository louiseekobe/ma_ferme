import 'package:flutter/material.dart';
import 'package:ma_ferme/etang/histoire_etang.dart';
import 'package:video_player/video_player.dart';

class VoirHistoireEtang extends StatefulWidget {
  @override
  _VoirHistoireEtangState createState() => _VoirHistoireEtangState();
}

class _VoirHistoireEtangState extends State<VoirHistoireEtang> {
  //creer l'instance pour la vidéo
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    videoOnPlay();
  }

//fonction qui va se charger d'initialiser la video
  videoOnPlay() {
    _controller = VideoPlayerController.asset('image/video/histoire_video.mp4');
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("image/etang/etangbackground.jpg"),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: MediaQuery.of(context).size.height * 0.20,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 5)),
                  child: _controller.value.isInitialized //charger la video
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(_controller),
                              VideoProgressIndicator(
                                //barre de progression
                                _controller,
                                allowScrubbing: true,
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.285,
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  iconSize: 40,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              //bouton de retour
              GestureDetector(
                onTap: () {
                  _controller.pause();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return HistoireEtang();
                  }));
                },
                child: Container(
                    height: 150,
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
}
