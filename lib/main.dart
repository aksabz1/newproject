import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/provider/buttom_nav_provider.dart';
import 'package:salons/core/provider/select_role_provider.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/core/routes/routes_generator.dart';
import 'package:salons/features/advertise/presentation/provider/booking_or_create_ad_provider.dart';
import 'package:salons/core/provider/location_provider.dart';
import 'package:salons/features/authentication/presentation/provider/login_provider.dart';
import 'package:salons/features/authentication/presentation/provider/otp_provider.dart';
import 'package:salons/features/business_management/presentation/provider/my_subscription_provider.dart';
import 'package:salons/features/onboarding/presentation/provider/connection_provider.dart';
import 'package:salons/features/onboarding/presentation/provider/onborading_provider.dart';
import 'package:salons/locator.dart';
import 'package:salons/core/constants/theme.dart';
import 'package:showcaseview/showcaseview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  await initLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnetctionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OnBoardingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OTPProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectRoleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingOrCreateAdProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ButtomNavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MySubscriptionProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 1066),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ShowCaseWidget(
          blurValue: 2,
          autoPlayDelay: const Duration(seconds: 3),
          builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.splashRoute,
              theme: AppTheme.lightTheme,
            );
          },
        );
      },
    );
  }
}
