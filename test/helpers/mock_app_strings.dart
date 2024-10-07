import 'package:diletta_test/core/helpers/l10n_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_pt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MockAppStrings implements AppStrings {
  @override
  AppLocalizations get l10n => AppLocalizationsPt();
}