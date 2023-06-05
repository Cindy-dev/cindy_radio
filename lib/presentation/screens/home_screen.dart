import 'package:cindy_radio/presentation/widget/recently_played.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/presentation/widget/home_header.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/presentation/screens/playing.dart';
import 'package:cindy_radio/presentation/widget/spin_wave.dart';

import '../../logic/recently_played_vm.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(clickCountVm);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(
            title: "Discover",
          ),
          RecentlyPlayed(),
          Padding(
            padding: const EdgeInsets.only(left: 22, bottom: 10, top: 35),
            child: Text("Trending Stations", style: AppTextStyles.heading3Bold),
          ),
          vm.when(
              error: (e, s) => Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      e.toString(),
                      style: AppTextStyles.headingSemiBold,
                    ),
                  )),
              loading: () => Expanded(
                    child: Center(
                        child: SpinKitWaveSpinner(
                      color: Color(0xfffd8b19),
                    )),
                  ),
              data: (data) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 5,
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            mainAxisSpacing: 20),
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          final station = data[i];
                          return GestureDetector(
                              onTap: () {
                                ref
                                    .read(recentlyPlayedStationVM.notifier)
                                    .addToRecentlyPlayed(
                                      stationuuid: station.stationuuid!,
                                      url: station.url!,
                                      name: station.name!,
                                      clickcount: station.clickcount!.toInt(),
                                      countrycode: station.countrycode!,
                                      favicon: station.favicon!,
                                      country: station.country!,
                                      tags: station.tags!,
                                    );
                                Navigator.push(context,
                                    CupertinoPageRoute(builder: (context) {
                                  return PlayingScreen(
                                    currentIndex: i,
                                    radioList: data,
                                  );
                                }));

                              },
                              child: Container(
                                width: context.deviceWidth() / 2.3,
                                padding: const EdgeInsets.only(right: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (station.favicon! == "")
                                      Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        height: context.deviceHeight() / 4,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 0.35),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "asset/image/default.png"),
                                              fit: BoxFit.fitWidth,
                                            )),
                                      )
                                    else
                                      Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        height: context.deviceHeight() / 4,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            station.favicon!,
                                          ),
                                          fit: BoxFit.fitWidth,
                                        )),
                                      ),
                                    Text(
                                      station.name!.trim(),
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.heading3Bold,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "${station.state}${station.country}"
                                            .trim(),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.subtitle1,
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }),
                  ),
                );
              })
        ],
      ),
    );
  }
}
