import 'package:flutter/material.dart';
import '../../utils/theme/theme.dart';

class HomeHeader extends StatelessWidget {
  final String title;
  const HomeHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 22),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.displayLarge,
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
