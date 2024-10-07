import 'package:diletta_test/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/setup_locator.dart';
import 'core/impl/database/hive_adapters.dart';
import 'core/routes/path/app_route_path.dart';
import 'core/routes/route_observer.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await getIt.allReady();
  await Hive.initFlutter();
  initHiveAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: MaterialApp(
              navigatorObservers: [
                routeObserver,
              ],
              onGenerateRoute: (settings) {
                final WidgetBuilder? widgetBuilder = appRoutes[settings.name];
                if (widgetBuilder == null) return null;
                return MaterialPageRoute(
                  builder: (context) => Container(
                    child: widgetBuilder(context),
                  ),
                  settings: settings,
                );
              },
              navigatorKey: NavigationService.navigationKey,
              initialRoute: AppRoutePath.homePage.path,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('pt', 'BR'),
                Locale('en'),
              ]),
        );
      },
    );
  }
}
