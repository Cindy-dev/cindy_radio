import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final valueStateProvider =
    StateProvider.family<int, int>((ref, index) => index);

class PlayerVm {
  final Ref ref;
  late AudioPlayer audioPlayer;
  PlayerVm(this.ref, [AudioPlayer? audioPlayer])
      : this.audioPlayer = audioPlayer ?? AudioPlayer();

  Future<void> playAudio(String audioUrl) async {
    await audioPlayer.setUrl(audioUrl);
    await audioPlayer.play();
  }

  Future<void> pauseAudio() async {
    await audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
  }

  void goToNextAudio(
      {required List<RadioModel> radioList,
      required int playingIndex,
      required AudioPlayer initializedPlayer}) async {
    if (playingIndex < radioList.length - 1) {
      playingIndex++;
    } else {
      playingIndex = 0;
    }
    initializedPlayer.setUrl(radioList[playingIndex].url!);
    initializedPlayer.play();
  }

  void goToPreviousAudio(
      {required int playingIndex,
      required List<RadioModel> radioList,
      required AudioPlayer initializedPlayer}) {
    if (playingIndex > 0) {
      playingIndex--;
    } else {
      throw Exception("Error");
    }
    initializedPlayer.setUrl(radioList[playingIndex].url!);
    initializedPlayer.play();
  }

  void dispose() async {
    await audioPlayer.dispose();
  }
}

final playingViewModelProvider =
    Provider.autoDispose<PlayerVm>((ref) => PlayerVm(ref));
