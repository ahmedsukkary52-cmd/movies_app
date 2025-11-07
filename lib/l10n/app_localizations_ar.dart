// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق الافلام';

  @override
  String get welcomeMessage => 'اهلا بيك يا روح امك';

  @override
  String get update_profile_pick_avatar => 'اختر صورة شخصية';

  @override
  String get update_profile_reset_password => 'إعادة تعيين كلمة المرور';

  @override
  String get update_profile_delete_account => 'حذف الحساب';
}
