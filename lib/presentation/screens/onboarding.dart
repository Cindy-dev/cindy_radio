import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cindy_radio/presentation/screens/nav_bar_screen.dart';
import 'package:cindy_radio/utils/theme/deviceSize.dart';
import 'package:cindy_radio/utils/theme/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../logic/radio_vm.dart';

class OnboardingScreen extends StatefulHookConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await ref.read(clickCountVm).value;
    ref.read(radioStationsVm).value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Spacer(),
          Flexible(
            flex: 2,
            child: Align(
                alignment: Alignment.center,
                child: Image.asset("asset/image/radio.png")),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                CupertinoPageRoute(builder: (context) => NavBarScreen())),
            child: Container(
              alignment: Alignment.center,
              margin:
                  EdgeInsets.symmetric(horizontal: context.deviceWidth() / 15),
              width: context.deviceWidth(),
              padding: EdgeInsets.symmetric(vertical: 21),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: appTheme.primaryColor),
              child: Text(
                "Get Started",
                style: AppTextStyles.buttonText,
              ),
            ),
          ),
          SizedBox(
            height: context.deviceHeight() / 27,
          )
        ],
      ),
    );
  }
}
