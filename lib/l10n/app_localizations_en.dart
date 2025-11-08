// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Movie App';

  @override
  String get welcomeMessage => 'Welcome to our app!';

  @override
  String get update_profile_pick_avatar => 'Pick Avatar';

  @override
  String get update_profile_reset_password => 'Reset Password';

  @override
  String get update_profile_delete_account => 'Delete Account';

  @override
  String get update_profile_update_data => 'Update Data';
}
