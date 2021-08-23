import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Musicplayer extends StatefulWidget {
  const Musicplayer({Key? key}) : super(key: key);

  @override
  _MusicplayerState createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  bool _playing = false;
  IconData playBtn = Icons.play_circle_fill_rounded;

  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Slider.adaptive(
        activeColor: Color(0xFF781878),
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        max: position.inSeconds.toDouble(),
        onChanged: (value) {
          seekToSec(value);
        });
  }

  void seekToSec(sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    // ignore: unnecessary_statements
    _player.onDurationChanged.listen((Duration d) {
      setState(() => musicLength = d);
    });

    _player.onAudioPositionChanged
        .listen((Duration p) => {setState(() => position = p)});

    cache.load("music/whenever wherever.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playing now"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 13,
                      color: Color(0xFFC048A8).withOpacity(0.4),
                      spreadRadius: 15,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/shakira.jpg"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Whenever wherever",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Shakira",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text("${position.inMinutes} : ${position.inSeconds.remainder(60)}"),
                slider(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    // padding: EdgeInsets.only(top: 12),
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xFFC048A8).withOpacity(0.2),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 30,
                        color: Color(0xFFC048A8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (!_playing) {
                      cache.play("music/whenever wherever.mp3");
                      setState(() {
                        playBtn = Icons.play_circle_fill_rounded;
                        _playing = true;
                      });
                    } else {
                      _player.pause();
                      setState(() {
                        playBtn = Icons.pause_circle_filled_rounded;
                        _playing = false;
                      });
                    }
                  },
                  icon: Icon(
                    playBtn,
                    size: 80,
                    color: Color(0xFFC048A8),
                  ),
                ),
                SizedBox(width: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(left: 20, top: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xFFC048A8).withOpacity(0.2),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 30,
                        color: Color(0xFFC048A8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
