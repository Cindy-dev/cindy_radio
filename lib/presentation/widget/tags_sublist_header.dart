import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';
import 'package:cindy_radio/utils/app_extension.dart';

class TagsSublistHeader extends StatelessWidget {
  final String stationName;
  const TagsSublistHeader({Key? key, required this.stationName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: appTheme.cardColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31),
            child: Text(
              stationName.capitalize(),
              style: AppTextStyles.displayLarge,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("asset/image/search.png"),
          ),
        ],
      ),
    );
  }
}
