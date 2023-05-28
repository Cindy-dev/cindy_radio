import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.colorScheme.secondary,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.bodySemiBoldPrimary,
        unselectedLabelStyle: AppTextStyles.bodySemiBold,
        backgroundColor: appTheme.colorScheme.secondary,
        unselectedItemColor: appTheme.shadowColor,
        selectedItemColor: appTheme.primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: ImageIcon(AssetImage("asset/image/home.png")),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: ImageIcon(AssetImage("asset/image/Vector.png")),
              ),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 11),
                child: ImageIcon(AssetImage("asset/image/fave.png")),
              ),
              label: "Favorites")
        ],
      ),
    );
  }
}
