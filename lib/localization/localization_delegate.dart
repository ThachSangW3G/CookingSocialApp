import 'package:cooking_social_app/localization/app_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Localization delegate that builds an [AppLocalization] instance
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}