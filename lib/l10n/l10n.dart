import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/l10n/gen/app_localizations.dart';

export 'package:vibe_games_demo/l10n/gen/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
