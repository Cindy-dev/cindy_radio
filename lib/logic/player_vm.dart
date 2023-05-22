import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerVm {
  final Ref ref;
  final AudioPlayer _audioPlayer;
  final String audioUrls;
  int currentIndex;
  PlayerVm(this.ref, this.audioUrls)
      : _audioPlayer = AudioPlayer(),
        currentIndex = 0;
  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> playAudio(String url) async {
    await _audioPlayer.setUrl(url);
    await _audioPlayer.play();
  }

  Future<void> pauseAudio() async {
    await _audioPlayer.pause();
  }

  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  void goToNextAudio(radioList, currentInde, url) async {
    // currentIndex++;
    // if (currentIndex >= audioUrls.length) {
    //   currentIndex = 0;
    // }

    if (currentInde < radioList.length - 1) {
      currentInde++;
    } else {
      currentInde = 0;
    }
    print(currentInde);
   _audioPlayer.stop();
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
  }

  void goToPreviousAudio() {
    currentIndex--;
    if (currentIndex < 0) {
      currentIndex = audioUrls.length - 1;
    }
  }

  void dispose() async {
    await _audioPlayer.dispose();
  }
}

final playingViewModelProvider =
    Provider.family.autoDispose<PlayerVm, String>((ref, audioUrl) {
  final playerVm = PlayerVm(ref, audioUrl);
  ref.onDispose(() {
    playerVm._audioPlayer.dispose();
  });

  return playerVm;
});
