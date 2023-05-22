import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioControlButtons extends StatefulWidget {
  final AudioPlayer player;
  final VoidCallback nextAudio;
  final VoidCallback previousAudio;
  const AudioControlButtons({
    Key? key,
    required this.nextAudio,
    required this.previousAudio,
    required this.player,
  }) : super(key: key);

  @override
  State<AudioControlButtons> createState() => _AudioControlButtonsState();
}

class _AudioControlButtonsState extends State<AudioControlButtons> {
  bool isPlaying = true;
  void playOrResume() {
    setState(() {
      if (widget.player.playing == true) {
        isPlaying = false;
        widget.player.stop();
      } else {
        isPlaying = true;
        widget.player.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: widget.previousAudio,
            child: Icon(
              Icons.skip_previous,
              size: 70,
              color: Color(0xff58585a),
            ),
          ),
          GestureDetector(
            onTap: playOrResume,
            child: Container(
                height: deviceSize.height / 10,
                width: deviceSize.width / 3,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xfffeb322),
                      Color(0xfffd8918),
                      Color(0xfffd8b19)
                    ])),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 50,
                )),
          ),
          GestureDetector(
            onTap: widget.nextAudio,
            child: Icon(
              Icons.skip_next,
              size: 70,
              color: Color(0xff58585a),
            ),
          ),
        ],
      ),
    );
  }
}
