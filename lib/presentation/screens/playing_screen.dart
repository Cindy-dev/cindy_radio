import '../../app.dart';

class PlayingScreen extends StatefulHookConsumerWidget {
  final List<RadioModel> radioList;
  final int currentIndex;

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
    // so i am thinking the .autoDispose from the provider could do this
    _playingViewModel?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(valueStateProvider(widget.currentIndex));
    final currentStation = widget.radioList[value];
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
                    onTap: () {
                      ref
                          .read(
                              valueStateProvider(widget.currentIndex).notifier)
                          .state = widget.currentIndex;
                      Navigator.pop(context);
                    },
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
                        .read(valueStateProvider(widget.currentIndex).notifier)
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
            ],
          ),
        ),
      ),
    );
  }
}
