import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 31),
          child: Text(
            "Discover",
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
    );
  }
}
