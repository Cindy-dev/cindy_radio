import 'dart:ui';
import 'package:flutter/material.dart';

class TagData {
  static List<String> imageAssets = [
    'asset/image/stationImage/station1.png',
    'asset/image/stationImage/station2.png',
    'asset/image/stationImage/station3.png',
    'asset/image/stationImage/station4.png',
    'asset/image/stationImage/station5.png',
    'asset/image/stationImage/station6.png',
    'asset/image/stationImage/station7.png',
    'asset/image/stationImage/station8.png',
    'asset/image/stationImage/station9.png',
    'asset/image/stationImage/station10.png',
  ];
  static Map<String, String> getImageMapping(List<String> tagStrings) {
    Map<String, String> imageMapping = {};

    // Assign images to API strings
    for (int i = 0; i < tagStrings.length; i++) {
      String apiString = tagStrings[i];
      String imageAsset = imageAssets[i % imageAssets.length];
      imageMapping[apiString] = imageAsset;
    }

    return imageMapping;
  }


  static Color getOverlayColor(int i) {
    List<Color> overlayColors = [
      Color(0xff3562FF).withOpacity(0.4),
      Color(0xffFB35FF).withOpacity(0.4),
      Color(0xffFF35AE).withOpacity(0.4),
      Color(0xff2F82FF).withOpacity(0.4),
      Color(0xffFFA929).withOpacity(0.4),
      Color(0xffFE2566).withOpacity(0.4),
      Color(0xffDE0795).withOpacity(0.4),
      Color(0xff0ABE1C).withOpacity(0.4),
      Color(0xff0D0670).withOpacity(0.4),
      Color(0xff00F0FF).withOpacity(0.5),
      Color(0xffC3F0FF).withOpacity(0.5)
    ];
    int colorIndex = i % overlayColors.length;
    return overlayColors[colorIndex];
  }
}
