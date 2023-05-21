import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class AudioControlButtons extends StatefulWidget {
  final AudioPlayer player;

  const AudioControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  State<AudioControlButtons> createState() => _AudioControlButtonsState();
}

class _AudioControlButtonsState extends State<AudioControlButtons> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Consumer(builder: (_, ref, child) {
        final vm = ref.watch(radioStationsProvider);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.skip_previous,
              size: 70,
              color: Color(0xff58585a),
            ),
            Container(
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
                Icons.pause,
                size: 50,
              ),
            ),
            GestureDetector(
              onTap: (){
                ref.read(radioStationsProvider).navigateToNextItem();
              },
              child: Icon(
                Icons.skip_next,
                size: 70,
                color: Color(0xff58585a),
              ),
            ),
          ],
        );
      }),
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Opens volume slider dialog
//         // IconButton(
//         //   icon: const Icon(Icons.volume_up),
//         //   onPressed: () {
//         //     showSliderDialog(
//         //       context: context,
//         //       title: "Adjust volume",
//         //       divisions: 10,
//         //       min: 0.0,
//         //       max: 1.0,
//         //       value: player.volume,
//         //       stream: player.volumeStream,
//         //       onChanged: player.setVolume,
//         //     );
//         //   },
//         // ),
//
//         /// This StreamBuilder rebuilds whenever the player state changes, which
//         /// includes the playing/paused state and also the
//         /// loading/buffering/ready state. Depending on the state we show the
//         /// appropriate button or loading indicator.
//         StreamBuilder<PlayerState>(
//           stream: player.playerStateStream,
//           builder: (context, snapshot) {
//             final playerState = snapshot.data;
//             final processingState = playerState?.processingState;
//             final playing = playerState?.playing;
//             if (processingState == ProcessingState.loading ||
//                 processingState == ProcessingState.buffering) {
//               return Container(
//                 margin: const EdgeInsets.all(8.0),
//                 width: 64.0,
//                 height: 64.0,
//                 child: const CircularProgressIndicator(),
//               );
//             } else if (playing != true) {
//               return IconButton(
//                 icon: const Icon(Icons.play_arrow),
//                 iconSize: 64.0,
//                 onPressed: player.play,
//               );
//             } else if (processingState != ProcessingState.completed) {
//               return IconButton(
//                 icon: const Icon(Icons.pause),
//                 iconSize: 64.0,
//                 onPressed: player.pause,
//               );
//             } else {
//               return IconButton(
//                 icon: const Icon(Icons.replay),
//                 iconSize: 64.0,
//                 onPressed: () => player.seek(Duration.zero),
//               );
//             }
//           },
//         ),
//         // Opens speed slider dialog
//         // StreamBuilder<double>(
//         //   stream: player.speedStream,
//         //   builder: (context, snapshot) => IconButton(
//         //     icon: Text("${snapshot.data?.toStringAsFixed(1)}x",
//         //         style: const TextStyle(fontWeight: FontWeight.bold)),
//         //     onPressed: () {
//         //       showSliderDialog(
//         //         context: context,
//         //         title: "Adjust speed",
//         //         divisions: 10,
//         //         min: 0.5,
//         //         max: 1.5,
//         //         value: player.speed,
//         //         stream: player.speedStream,
//         //         onChanged: player.setSpeed,
//         //       );
//         //     },
//         //   ),
//         // ),
//       ],
    );
  }
}
