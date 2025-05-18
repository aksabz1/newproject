import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/constants/showcase_keys.dart';
import 'package:salons/core/utils/prefs_operator.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/features/advertise/repositories/ad_repository.dart';
import 'package:salons/features/onboarding/presentation/provider/connection_provider.dart';
import 'package:salons/locator.dart';
import 'package:showcaseview/showcaseview.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PrefsOperator prefsOperator = locator.get<PrefsOperator>();
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ConnetctionProvider>(context, listen: false);
    provider.checkConnection();
    _checkShowCaseStatus();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        _goToNextScreen(provider.isConnected);
      },
    );


    // AdRepository adRepository = locator();
    // adRepository.fetchAds();
  }

  void _checkShowCaseStatus() async {
    if (!prefsOperator.isShowCaseWasShown()) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ShowCaseWidget.of(context).startShowCase(
            [
              ShowcaseKeys.one,
              ShowcaseKeys.two,
              ShowcaseKeys.three,
              ShowcaseKeys.four,
              ShowcaseKeys.five,
            ],
          );
        },
      );
    }
  }

  void _goToNextScreen(bool isConnected) {
    print('im here in goNextscreen------------');
    if (isConnected) {
      print('im here in goNextscreen iin isconnected---------------');
      if (!prefsOperator.isOnboardingSeen()) {
        Navigator.pushReplacementNamed(
          context,
          Routes.onBoardingRoute,
        );
      } else if (!prefsOperator.isUserLoggedIn()) {
        Navigator.pushReplacementNamed(
          context,
          Routes.loginRoute,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          Routes.mainRoute,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 250,
                child: DelayedWidget(
                  delayDuration: const Duration(milliseconds: 200),
                  animationDuration: const Duration(seconds: 1),
                  animation: DelayedAnimations.SLIDE_FROM_TOP,
                  child: Image.asset(
                    'assets/images/splash_logo1.png',
                  ),
                ),
              ),
            ),
            Consumer<ConnetctionProvider>(
              builder: (context, connectionProvider, _) {
                return Visibility(
                  visible: !connectionProvider.isConnected,
                  child: const Padding(
                    padding: EdgeInsets.only(bottom: 60.0),
                    child: Text('لطفا اتصال اینترنت خود را بررسی کنید'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
