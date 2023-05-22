import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/presentation/widget/audio_control_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayingScreen extends StatefulHookConsumerWidget {
  final List<RadioModel> radioList;
  int currentIndex;

  PlayingScreen({
    Key? key,
    required this.radioList,
    required this.currentIndex,
  }) : super(key: key);

  @override
  ConsumerState<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends ConsumerState<PlayingScreen> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    player = AudioPlayer();
    await player.setUrl(widget.radioList[widget.currentIndex].url!);
    player.play();

  }

  void playPreviousStation() {
    setState(() {
      if (widget.currentIndex > 0) {
        widget.currentIndex--;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No previous audio',
              textAlign: TextAlign.center,
            ),
          ),
        );
        //widget.currentIndex = widget.radioList.length - 1;
      }
      //player.stop();
      playCurrentStation();
    });
  }

  void playNextStation() {
    setState(() {
      if (widget.currentIndex < widget.radioList.length - 1) {
        widget.currentIndex++;
      } else {
        widget.currentIndex = 0;
      }
      //player.stop();
      playCurrentStation();
    });
  }

  void playCurrentStation() async {
    final audioUrl = widget.radioList[widget.currentIndex].url!;
    await player.setUrl(audioUrl);
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStation = widget.radioList[widget.currentIndex];
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff1f2029),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff58585a),
                    ),
                  ),
                  SizedBox(
                    width: deviceSize.width / 3.3,
                  ),
                  Text(
                    "Playing",
                    style: TextStyle(color: Color(0xff58585a), fontSize: 25),
                  ),
                ],
              ),
              currentStation.favicon!.isEmpty
                  ? Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: deviceSize.height / 13),
                          height: deviceSize.height / 2.5,
                          width: deviceSize.width / 1.5,
                          decoration: BoxDecoration(
                            color: Color(0xff58585a),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Positioned(
                            top: deviceSize.height / 4,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 50),
                              child: Text(
                                "Image Unavailable",
                                style: TextStyle(fontSize: 20),
                              ),
                            ))
                      ],
                    )
                  : Container(
                      height: deviceSize.height / 2.5,
                      width: deviceSize.width / 1.5,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(top: deviceSize.height / 13),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        currentStation.favicon!,
                        fit: BoxFit.contain,
                      )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  currentStation.country ?? "ndd",
                  style: TextStyle(
                      color: Color(0xff58585a),
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Text(
                currentStation.name!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              AudioControlButtons(
                player: player,
                nextAudio: playNextStation,
                previousAudio: playPreviousStation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
