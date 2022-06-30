import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cindy_radio/model/radio_model.dart';
import 'package:cindy_radio/model/response_data.dart';
import 'package:cindy_radio/service/radio_api.dart';
import 'package:cindy_radio/widget/page_manager.dart';
import 'package:flutter/material.dart';

class Playing extends StatefulWidget {
  const Playing({Key key}) : super(key: key);

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  PageManager _pageManager;

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
    //RadioAPI().fetchStations();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RadioModel>(
        future: RadioAPI().fetchStations(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.hasData) {
            return ListView.builder(
              itemBuilder: (ctx, i) {
                return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ValueListenableBuilder<ProgressBarState>(
                          valueListenable: _pageManager.progressNotifier,
                          builder: (_, value, __) {
                            return ProgressBar(
                              progress: value.current,
                              buffered: value.buffered,
                              total: value.total,
                              onSeek: _pageManager.seek,
                            );
                          },
                        ),
                        ValueListenableBuilder<ButtonState>(
                          valueListenable: _pageManager.buttonNotifier,
                          // ignore: missing_return
                          builder: (_, value, __) {
                            switch (value) {
                              case ButtonState.loading:
                                return Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: 32.0,
                                  height: 32.0,
                                  child: const CircularProgressIndicator(),
                                );
                              case ButtonState.paused:
                                return IconButton(
                                  icon: const Icon(Icons.play_arrow),
                                  iconSize: 32.0,
                                  onPressed: _pageManager.play,
                                );
                              case ButtonState.playing:
                                return IconButton(
                                  icon: const Icon(Icons.pause),
                                  iconSize: 32.0,
                                  onPressed: _pageManager.pause,
                                );
                            }
                          },
                        ),
                      ]),
                );
              },
              itemCount: ResponseData.radioResponseModel.country[1].length,
            );
          } else {
            return Text('ffkkkr');
          }
        },
      ),
    );
  }
}
