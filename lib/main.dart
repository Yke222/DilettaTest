import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'core/service_locator/main_service_locator.dart';
import 'src/app.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await MainServiceLocator().inject();

    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR');

    runApp(const MyApp());
  }, (error, stackTrace) {
    if (!kIsWeb && kReleaseMode) {
      debugPrint('App error: \n $error');
    }
  });
}
