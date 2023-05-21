
import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/presentation/widget/audio_control_buttons.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayingScreen extends StatefulWidget {
  final RadioModel radioModel;

  const PlayingScreen({
    Key? key,
    required this.radioModel,
  }) : super(key: key);

  @override
  State<PlayingScreen> createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  late AudioPlayer player;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    await player.setUrl(widget.radioModel.url!);
    player.play();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              widget.radioModel.favicon!.isEmpty
                  ? Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: deviceSize.height / 13),
                          height: deviceSize.height / 2.5,
                          width: deviceSize.width / 1.5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
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
                        widget.radioModel.favicon!,
                        fit: BoxFit.contain,
                      )),
              Spacer(),
              AudioControlButtons(player),
            ],
          ),
        ),
      ),
    );
  }
}
