import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/presentation/widget/tags_sublist_header.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import '../../utils/theme/theme.dart';

class TagsSubListScreen extends StatelessWidget {
  final String stationName;
  final List<RadioModel> station;
  const TagsSubListScreen(
      {Key? key, required this.station, required this.stationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    return Scaffold(
      backgroundColor: appTheme.colorScheme.secondary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagsSublistHeader(stationName: stationName),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: station.length,
                  itemBuilder: (context, i) {
                    final stationData = station[i];
                    return Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              station[i].favicon == ""
                                  ? Container(
                                      height: context.deviceHeight() / 10,
                                      width: context.deviceWidth() / 4,
                                      margin: EdgeInsets.only(
                                          bottom: 24, right: 14),
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(
                                          bottom: 24, right: 14),
                                      height: context.deviceHeight() / 10,
                                      width: context.deviceWidth() / 4,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                              stationData.favicon!,
                                            ),
                                            fit: BoxFit.contain,
                                          )),
                                    ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stationData.name!.trim(),
                                      style: AppTextStyles.headingSemiBold,
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      stationData.country!.trim(),
                                      style: AppTextStyles.subtitle2,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.deviceWidth() / 17),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appTheme.primaryColorLight
                                          .withOpacity(0.4)),
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 24,
                                    color: appTheme.primaryColor,
                                  )),
                            ),
                            SizedBox(width: context.deviceWidth() / 22),
                            Icon(
                              Icons.more_vert,
                              size: 30,
                              color: appTheme.cardColor,
                            )
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}