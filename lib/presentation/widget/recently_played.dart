import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/logic/recently_played_vm.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';

class RecentlyPlayed extends ConsumerWidget {
  const RecentlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(fetchRecentlyPlayedStationVM);
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: vm.when(
              data: (recentStations) {
                return recentStations.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.only(top: 24),
                        width: context.deviceWidth(),
                        height: context.deviceHeight() / 3.5,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: recentStations.length,
                          itemBuilder: (context, i) {
                            print(recentStations.length);
                            final data = recentStations[i];
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
                                        image: data.favicon != null &&
                                                data.favicon!.isNotEmpty
                                            ? CachedNetworkImageProvider(
                                                    data.favicon!.toString())
                                                as ImageProvider<Object>
                                            : AssetImage(
                                                "asset/image/default.png"),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    data.name?.trim() ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.heading3Bold,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data.country}".trim(),
                                      style: AppTextStyles.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: 24),
                        width: context.deviceWidth(),
                        height: context.deviceHeight() / 3.5,
                        child: Center(
                          child: Text("Recently Played List is Empty",
                              style: AppTextStyles.heading3Bold),
                        ),
                      );
              },
              error: (e, s) {
                final error = vm.error.toString();
                return Text(
                  error,
                  style: AppTextStyles.bodyMedium,
                );
              },
              loading: () => CircularProgressIndicator())),
    );
  }
}
