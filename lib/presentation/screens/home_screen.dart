import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/utils/app_data.dart';
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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(clickCountVm);
    final fetchStations = ref.watch(radioStationsVm);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(
            title: "Discover",
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recently Played", style: AppTextStyles.heading3Bold),
                fetchStations.when(
                  data: (data) {
                    return Container(
                      margin: EdgeInsets.only(top: 24),
                      width: context.deviceWidth(),
                      height: context.deviceHeight() / 3.5,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, i) {
                            final data = fetchStations.value?[i];
                            return Container(
                              width: context.deviceWidth() / 2.3,
                              padding: const EdgeInsets.only(right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 16),
                                    height: context.deviceHeight() / 5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: data?.favicon != null &&
                                                data!.favicon!.isNotEmpty
                                            ? CachedNetworkImageProvider(
                                                    data.favicon!.toString())
                                                as ImageProvider<Object>
                                            : AssetImage(
                                                "asset/image/default.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data?.name?.trim() ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.heading3Bold,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data?.state}${data?.country}".trim(),
                                      style: AppTextStyles.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  },
                  error: (e, s) => Container(
                      margin: EdgeInsets.only(top: 24, right: 22),
                      width: context.deviceWidth(),
                      height: context.deviceHeight() / 3.5,
                      child: Text(e.toString(),
                          style: AppTextStyles.headingSemiBold)),
                  loading: () => Container(
                    margin: EdgeInsets.only(top: 24),
                    width: context.deviceWidth(),
                    height: context.deviceHeight() / 3.5,
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Color(0xfffd8b19),
                    )),
                  ),
                ),
              ],
            ),
          ),
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
