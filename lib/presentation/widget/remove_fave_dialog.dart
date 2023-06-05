import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';

removeFromFaveDialog(
    BuildContext context, String stationName, VoidCallback removeAction) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.all(0.0),
        backgroundColor: appTheme.colorScheme.secondary,
        title: Text("Remove from Liked Channel?",
            textAlign: TextAlign.center, style: AppTextStyles.heading2Bold),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(stationName,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headingSemiBold.copyWith(
                      fontWeight: FontWeight.w500, color: Color(0xffDADADA))),
              SizedBox(height: 40),
              TextButton(
                  onPressed: removeAction,
                  style: TextButton.styleFrom(
                      backgroundColor: appTheme.primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 13)),
                  child: Text(
                    "Remove",
                    style: AppTextStyles.heading3Bold,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text("Cancel",
                      style: AppTextStyles.heading3Bold
                          .copyWith(color: Color(0xffDADADA))),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
