import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salons/core/utils/prefs_operator.dart';
import 'package:salons/features/advertise/data/data_source/remote/ad_api_provider.dart';
import 'package:salons/features/advertise/repositories/ad_repository.dart';
import 'package:salons/features/onboarding/repositories/connection_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/main/data/data_source/remote/service_types_api_provider.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30), // 60 seconds
      receiveTimeout: const Duration(seconds: 30),
      baseUrl: "http://185.19.201.87/api/v1/",
    ),
  );

  locator.registerSingleton<Dio>(dio);
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<PrefsOperator>(PrefsOperator());

  locator.registerSingleton<AdApiProvider>(AdApiProvider(dio));
  locator.registerSingleton<ServiceTypesApiProvider>(ServiceTypesApiProvider(dio));


  /// repositories
  locator.registerFactory<ConnetctionRepository>(() => ConnetctionRepository());

  locator.registerSingleton<AdRepository>(AdRepository(locator()));
  locator.registerSingleton<ServiceTypesApiProvider>(ServiceTypesApiProvider(locator()));



}
