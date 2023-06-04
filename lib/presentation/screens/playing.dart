import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/logic/favorite_stations_vm.dart';
import 'package:cindy_radio/presentation/widget/audio_control_buttons.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/repository/service/favorite_radio_service.dart';
import '../../logic/player_vm.dart';

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
  PlayerVm? _playingViewModel;
  @override
  void initState() {
    super.initState();
    _playingViewModel = ref.read(playingViewModelProvider);
    _playingViewModel?.playAudio(widget.radioList[widget.currentIndex].url!);
  }

  @override
  void dispose() {
    _playingViewModel?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(valueStateProvider(widget.currentIndex));
    final currentStation = widget.radioList[value];
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: deviceSize.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffE09D16),
                Color(0xffC21C65),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.9]),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    ref
                        .read(valueStateProvider(widget.currentIndex).notifier)
                        .state = widget.currentIndex;
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: appTheme.cardColor,
                    size: 30,
                  ),
                ),
                currentStation.favicon!.isEmpty
                    ? Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: deviceSize.height / 20),
                          height: deviceSize.height / 2,
                          child: Text("Image Unavailable",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bodyMedium),
                        ),
                      )
                    : Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: deviceSize.height / 20, bottom: 20),
                            height: deviceSize.height / 2,
                            width: deviceSize.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                  currentStation.favicon!,
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        currentStation.name!.trim(),
                        textAlign: TextAlign.left,
                        style: AppTextStyles.displayLarge,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(favoriteStationVM.notifier)
                            .addToFavorite(currentStation);
                      },
                      child: Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: appTheme.cardColor,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    currentStation.tags!,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 48, bottom: 60),
                  child: Image.asset("asset/image/wave.png"),
                ),
                AudioControlButtons(
                  player: _playingViewModel!.audioPlayer,
                  nextAudio: () {
                    ref
                        .read(valueStateProvider(widget.currentIndex).notifier)
                        .state++;

                    ref.read(playingViewModelProvider).goToNextAudio(
                          radioList: widget.radioList,
                          playingIndex: value,
                          initializedPlayer: _playingViewModel!.audioPlayer,
                        );
                  },
                  previousAudio: () {
                    if (value > 0) {
                      ref
                          .read(
                              valueStateProvider(widget.currentIndex).notifier)
                          .state--;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'No previous audio',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    ref.read(playingViewModelProvider).goToPreviousAudio(
                          playingIndex: value,
                          radioList: widget.radioList,
                          initializedPlayer: _playingViewModel!.audioPlayer,
                        );
                  },
                ),
                SizedBox(
                  height: deviceSize.height / 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
