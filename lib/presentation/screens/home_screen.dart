import 'package:cached_network_image/cached_network_image.dart';
import 'package:cindy_radio/presentation/widget/home_header.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cindy_radio/logic/radio_vm.dart';
import 'package:cindy_radio/presentation/screens/playing.dart';
import 'package:cindy_radio/presentation/widget/spin_wave.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(radioStationsVm);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recently Played", style: AppTextStyles.heading3Bold),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  width: context.deviceWidth(),
                  height: context.deviceHeight() / 3.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, i) {
                        final data = vm.value?[i];
                        return Container(
                          width: context.deviceWidth() / 2.3,
                          padding: const EdgeInsets.only(right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              data!.favicon! == ""
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 16),
                                      height: context.deviceHeight() / 5,
                                    )
                                  : Container(
                                      margin: EdgeInsets.only(bottom: 16),
                                      height: context.deviceHeight() / 5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          data.favicon!,
                                        ),
                                        fit: BoxFit.fitWidth,
                                      )),
                                    ),
                              Text(
                                data.name!.trim(),
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.heading3Bold,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Expanded(
                                child: Text(
                                  "${data.state}${data.country}".trim(),
                                  style: AppTextStyles.subtitle1,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, bottom: 24, top: 45),
            child: Text("Trending Stations", style: AppTextStyles.heading3Bold),
          ),
          vm.when(
              error: (e, s) => Text(e.toString()),
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
                            crossAxisSpacing: 20,
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

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:cindy_radio/logic/radio_vm.dart';
// import 'package:cindy_radio/presentation/screens/playing.dart';
// import 'package:cindy_radio/presentation/widget/spin_wave.dart';
//
//
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final vm = ref.watch(radioStationsVm);
//     final deviceSize = MediaQuery.of(context).size;
//
//     return SafeArea(
//       bottom: false,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Choose a radio station you like",
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w700),
//             ),
//             SizedBox(height: deviceSize.height / 30),
//             vm.when(
//                 error: (e, s) => Text(e.toString()),
//                 loading: () => Expanded(
//                   child: Center(
//                       child: SpinKitWaveSpinner(
//                         color: Color(0xfffd8b19),
//                       )),
//                 ),
//                 data: (data) {
//                   return Expanded(
//                     child: GridView.builder(
//                         shrinkWrap: true,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisSpacing: 20,
//                             crossAxisCount: 2,
//                             childAspectRatio: 0.7,
//                             mainAxisSpacing: 20),
//                         itemCount: data.length,
//                         itemBuilder: (context, i) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(context,
//                                   CupertinoPageRoute(builder: (context) {
//                                     return PlayingScreen(
//                                       currentIndex: i,
//                                       radioList: data,
//                                     );
//                                   }));
//                             },
//                             child: Container(
//                               padding: EdgeInsets.all(15),
//                               decoration: BoxDecoration(
//                                 color: Colors.white.withOpacity(0.6),
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   data[i].favicon!.isEmpty
//                                       ? Stack(
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           color: Colors.grey,
//                                           borderRadius:
//                                           BorderRadius.circular(20),
//                                         ),
//                                       ),
//                                       Positioned(
//                                           top: 120,
//                                           left: 10,
//                                           bottom: 100,
//                                           child: Text(
//                                             "Image Unavailable",
//                                             style:
//                                             TextStyle(fontSize: 15),
//                                           ))
//                                     ],
//                                   )
//                                       : Container(
//                                     width: deviceSize.width / 1.5,
//                                     margin: EdgeInsets.only(
//                                         bottom: 0, top: 20),
//                                     child: Image.network(
//                                       data[i].favicon!,
//                                       fit: BoxFit.contain,
//                                     ),
//                                   ),
//                                   Positioned(
//                                       left: 10,
//                                       bottom: 0,
//                                       right: 10,
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           data[i].name!,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w700),
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   );
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
