import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

removeFromFaveDialog(BuildContext context, String stationName){
  return showDialog(context: context, builder: (context){
    return CupertinoAlertDialog(
      title: Text("Remove from Liked Channel?", style: AppTextStyles.heading2Bold),
      content : Text(stationName, style: AppTextStyles.headingSemiBold),
      actions: [
        Column(children: [
          
        ],)
      ],

    );
  });
}