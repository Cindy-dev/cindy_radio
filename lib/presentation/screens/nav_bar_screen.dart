import 'package:cindy_radio/presentation/screens/explore_screen.dart';
import 'package:cindy_radio/presentation/screens/favorite_screen.dart';
import 'package:cindy_radio/presentation/screens/home_screen.dart';
import 'package:cindy_radio/utils/scoped_navigator.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final customNavigator = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: [
          const HomeScreen(),
          ScopedNavigator(
            navigatorKey: customNavigator,
            defaultRoute: ScopedNavigatorChild(
              routeName: 'explore',
              routeWidget: const ExploreScreen(),
            ),
          ),
          const FavoriteScreen()
        ].elementAt(_selectedIndex),
        backgroundColor: appTheme.colorScheme.secondary,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: AppTextStyles.bodySemiBold,
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
      ),
    );
  }
}
