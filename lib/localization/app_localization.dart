import 'package:flutter/material.dart';

extension LocalizationExt on BuildContext {
  String localize(String value) {
    final code = AppLocalization.of(this).locale.languageCode;
    final database = AppLocalization._localizedValues;
    if (database.containsKey(code)) {
      return database[code]?[value] ?? "-";
    } else {
      return database['en']?[value] ?? "-";
    }
  }
}

class AppLocalization {
  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;

  static final Map<String, Map<String, String>> _localizedValues = {
    "en": {},
    "vn": {},
  };
}
