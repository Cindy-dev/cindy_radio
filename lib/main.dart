import 'package:cindy_radio/presentation/screens/explore_screen.dart';
import 'package:cindy_radio/presentation/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'data/repository/service/isar_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingScreen(),
        '/explore': (context) => const ExploreScreen(),
      },
    );
  }
}
