import 'package:cindy_radio/utils/theme/theme.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Image.asset("asset/image/sound.png"),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: widget.previousAudio,
              child: Image.asset("asset/image/prev.png"),
            ),
            GestureDetector(
              onTap: playOrResume,
              child: Container(
                  height: deviceSize.height / 10,
                  width: deviceSize.width / 3,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: appTheme.cardColor),
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 50,
                    color: Color(0xffC4255F),
                  )),
            ),
            GestureDetector(
              onTap: widget.nextAudio,
              child: Image.asset("asset/image/skip.png"),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: Image.asset("asset/image/share.png"),
            ),
          ],
        ),
      ),
    );
  }
}
