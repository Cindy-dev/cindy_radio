import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/data/repository/tagData.dart';
import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/presentation/screens/tags_sublist_screen.dart';
import 'package:cindy_radio/presentation/widget/home_header.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widget/spin_wave.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final station = ref.watch(radioStationsVm);
    final vm = ref.watch(tagsProvider);
    final radioModels = ref.watch(radioStationsVm).value ?? [];
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(title: "Explore"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Genres",
                    style: AppTextStyles.heading3Bold,
                  ),
                  station.when(
                      error: (e, s) => Expanded(child: Text(e.toString())),
                      loading: () => Expanded(
                            child: Center(
                                child: SpinKitWaveSpinner(
                              color: Color(0xfffd8b19),
                            )),
                          ),
                      data: (data) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 9,
                                        crossAxisCount: 3,
                                        childAspectRatio: 0.68,
                                        mainAxisSpacing: 10),
                                itemCount: vm.length,
                                itemBuilder: (context, i) {
                                  final tag = vm[i];
                                  Map<String, String> imageMapping =
                                      TagData.getImageMapping(vm);
                                  final stationsWithTag = ref.watch(
                                      tagClickShowListProvider(
                                          Tag(radioModels, tag)));
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (_) => TagsSubListScreen(
                                                station: stationsWithTag,
                                                stationName: vm[i],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 9),
                                              height:
                                                  context.deviceHeight() / 7,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      imageMapping[
                                                              vm[i].trim()] ??
                                                          "assets/image/default.png",
                                                    ),
                                                    fit: BoxFit.fitWidth,
                                                  )),
                                            ),
                                            Positioned.fill(
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 9),
                                                color:
                                                    TagData.getOverlayColor(i),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        vm[i].trim(),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.heading3Bold,
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        );
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
