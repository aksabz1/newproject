import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salons/core/widgets/main_wrapper.dart';
import 'package:salons/core/routes/routes.dart';
import 'package:salons/features/advertise/presentation/provider/salon_owner_image_provider.dart';
import 'package:salons/features/advertise/presentation/provider/seat_price_provider.dart';
import 'package:salons/features/appointment_management/presentation/provider/appointment_provider.dart';
import 'package:salons/features/authentication/presentation/screens/login_screen.dart';
import 'package:salons/features/authentication/presentation/screens/otp_screen.dart';
import 'package:salons/features/bookmarks/presentation/screens/bookmarks_screen.dart';
import 'package:salons/features/business_management/presentation/provider/business_form_image_provider.dart';
import 'package:salons/features/business_management/presentation/provider/edit_info_provider.dart';
import 'package:salons/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:salons/features/advertise/presentation/screens/beautician_ad_screen.dart';
import 'package:salons/features/advertise/presentation/screens/beautician_ad_creation_screen.dart';
import 'package:salons/features/business_management/presentation/screens/business_registration_screen.dart';
import 'package:salons/features/business_management/presentation/screens/edit_info_screen.dart';
import 'package:salons/features/support/presentation/screens/faqs_screen.dart';
import 'package:salons/features/chat/presentation/screens/chat_screen.dart';
import 'package:salons/features/main/presentation/screens/home_screen.dart';
import 'package:salons/features/advertise/presentation/screens/salon_ad_screen.dart';
import 'package:salons/features/business_management/presentation/screens/my_ads_screen.dart';
import 'package:salons/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:salons/features/appointment_management/presentation/screens/appointment_management_screen.dart';
import 'package:salons/features/advertise/presentation/provider/beautician_form_provider.dart';
import 'package:salons/features/advertise/presentation/provider/salon_form_validation_provider.dart';
import 'package:salons/features/advertise/presentation/screens/salon_owner_ad_creation_screen.dart';
import 'package:salons/features/business_management/presentation/screens/my_susbcription_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainWrapper());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.chatRoute:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case Routes.salonRoute:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<AppointmentProvider>(
                create: (context) => AppointmentProvider(),
                child: const SalonAdScreen()));
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.faqRoute:
        return MaterialPageRoute(builder: (_) => const FaqsScreen());
      case Routes.businessRegistrationRoute:
        return MaterialPageRoute(
            builder: (_) => const BusinessRegistrationScreen());
      case Routes.editInfoRoute:
        return MaterialPageRoute(
            builder: (_) => MultiProvider(providers: [
                  ChangeNotifierProvider<BusinessFormImageProvider>(
                    create: (context) => BusinessFormImageProvider(),
                  ),
                  ChangeNotifierProvider<BeauticianFormProvider>(
                    create: (context) => BeauticianFormProvider(),
                  ),
                  ChangeNotifierProvider<EditInfoProvider>(
                    create: (context) => EditInfoProvider(),
                  ),
                ], child: const EditInfoScreen()));
      case Routes.salonOwnerForm:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<SalonFormValidationProvider>(
            create: (context) => SalonFormValidationProvider(),
            child: MultiProvider(providers: [
              ChangeNotifierProvider(
                create: (context) => SalonFormValidationProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => SeatPriceProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => SalonOwnerImageProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => AppointmentProvider(),
              ),
            ], child: SalonOwnerAdCreationScreen()),
          ),
        );
      case Routes.beauticainForm:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<BeauticianFormProvider>(
            create: (context) => BeauticianFormProvider(),
            child: BeauticianAdCreationScreen(),
          ),
        );
      case Routes.reservationManagement:
        return MaterialPageRoute(
            builder: (_) => const AppointmentManagementScreen());
      case Routes.bookmark:
        return MaterialPageRoute(builder: (_) => const BookmarksScreen());
      case Routes.myAds:
        return MaterialPageRoute(builder: (_) => const MyAdsScreen());
      case Routes.beauticianAd:
        return MaterialPageRoute(builder: (_) => const BeauticianAdScreen());
      case Routes.subscription:
        return MaterialPageRoute(builder: (_) => const MySubscriptionScreen());
      case Routes.earningRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('صفحه مدنظر یافت نشد'),
        ),
        body: const Center(
          child: Text('صفحه مدنظر یافت نشد'),
        ),
      ),
    );
  }
}
