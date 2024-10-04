import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_alice/alice.dart';
import 'package:get_it/get_it.dart';

import '../../src/home/di.dart';
import '../../src/router.dart';
import '../core.dart';

final getIt = GetIt.I;

const apiUrl = String.fromEnvironment('API_URL');

class MainServiceLocator extends Injector {
  @override
  Future<void> inject() async {
    i.registerLazySingleton<Alice>(
      () => Alice(
        navigatorKey: rootNavigatorKey,
        showNotification: false,
      ),
    );

    i.registerLazySingleton<InternetConnectivity>(
      () => InternetConnectivityImpl(connectivity: Connectivity()),
    );

    i.registerLazySingleton<HttpClient>(
      () => DioHttpAdapter(baseUrl: apiUrl),
    );

    HomeInjector().inject();
  }
}
