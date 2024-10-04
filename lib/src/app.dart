import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../ui/theme/app_theme.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final alice = GetIt.I<Alice>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          title: 'Wish List',
          theme: AppTheme.light(),
          darkTheme: AppTheme.light(),
          routerConfig: appRouter,
          builder: (context, child) {
            return GestureDetector(
              onLongPress: () {
                if (kDebugMode) {
                  alice.showInspector();
                }
              },
              child: child,
            );
          },
        );
      },
    );
  }
}
