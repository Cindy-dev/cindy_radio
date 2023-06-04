import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/data/repository/service/favorite_radio_service.dart';
import 'package:cindy_radio/logic/favorite_stations_vm.dart';
import 'package:cindy_radio/presentation/widget/remove_fave_dialog.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/theme/theme.dart';
import '../widget/home_header.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(fetchFavoriteStationVM);
    final faveLength =
        ref.watch(favoriteRadioStationServiceProvider).faveModels;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(title: "Favorites"),
            vm.when(
                data: (data) {
                  return faveLength.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, i) {
                              final stationData = data[i];
                              return Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        stationData.favicon == ""
                                            ? Container(
                                                height:
                                                    context.deviceHeight() / 10,
                                                width:
                                                    context.deviceWidth() / 4,
                                                margin: EdgeInsets.only(
                                                    bottom: 24, right: 14),
                                              )
                                            : Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 24, right: 14),
                                                height:
                                                    context.deviceHeight() / 10,
                                                width:
                                                    context.deviceWidth() / 4,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      stationData.favicon!,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                stationData.name!.trim(),
                                                style: AppTextStyles
                                                    .headingSemiBold,
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
                                        onTap: () => removeFromFaveDialog(
                                            context, stationData.name, () {
                                          ref
                                              .read(favoriteStationVM.notifier)
                                              .addToFavorite(stationData);
                                          Navigator.pop(context);
                                          setState(() {});
                                        }),
                                        child: Icon(
                                          Icons.favorite,
                                          size: 24,
                                          color: appTheme.primaryColor,
                                        ),
                                      ),
                                      SizedBox(
                                          width: context.deviceWidth() / 22),
                                      Icon(
                                        Icons.more_vert,
                                        size: 30,
                                        color: appTheme.cardColor,
                                      )
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: Center(
                            child: Text("Favorite List is Empty",
                                style: AppTextStyles.heading3Bold),
                          ),
                        );
                },
                error: (e, s) {
                  final error = vm.error.toString();
                  return Text(error);
                },
                loading: () => CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
