import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // A-HomePage
  {
    'esjbhaj8': {
      'en': 'Welcome to the\n    Car Recovery App!',
      'ar': 'أهلا بكم في تطبيق \n            Car Recovery',
    },
    'nq3wobsa': {
      'en': '• Book a taxi anytime',
      'ar': '• احجز سيارة أجرة في أي وقت',
    },
    '2q0ki7fb': {
      'en': '• Request car recovery or towing services',
      'ar': '• اطلب خدمة سحب أو إنقاذ المركبات',
    },
    'yvz6u5fg': {
      'en': '• Track your car fleet and family in real time',
      'ar': '• تتبّع أسطول سياراتك وعائلتك في الوقت الحقيقي',
    },
    'rpup4o4s': {
      'en': '• Monitor your children and personal driver',
      'ar': '• راقب أطفالك وسائقك الخاص',
    },
    'bokyswk4': {
      'en': 'Start',
      'ar': 'البداية',
    },
    'cjpa2bj0': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // B1-Crane
  {
    '9scdha9r': {
      'en': '',
      'ar': '',
    },
    '4nkecl3c': {
      'en': 'New Booking',
      'ar': 'أدخل وجهتك',
    },
    '0lfizkg7': {
      'en': 'Book a Crane ride here.',
      'ar': 'إحجز مركبة الرافعة هنا',
    },
    '9fpd25hi': {
      'en': 'Please select a country in Settings.',
      'ar': 'يرجى اختيار الدولة من الإعدادات.',
    },
    '5cw0hfbu': {
      'en': 'Please select a country \nin Settings.',
      'ar': 'يرجى اختيار الدولة من الإعدادات.',
    },
    'n8rwlfvt': {
      'en': 'Crane',
      'ar': 'الرافعات',
    },
    'gqkou7if': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'h6zdbgmt': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'h8mligxi': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'sgp0al4c': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'q46xua83': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'fm8gub21': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'z7voaiid': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'xockar92': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'pu5maqyu': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '9e02i4qu': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'rkw8hh5m': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '52ibp2mu': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'be1yii5x': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '3dxl1v27': {
      'en': 'Recovery',
      'ar': 'الرافعات',
    },
  },
  // C-Mechanicshops
  {
    'tnqn5uqq': {
      'en': 'Shops',
      'ar': 'محلات ',
    },
    's26eo8un': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    '55d64gt0': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'v9ckns3k': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '5nyb01y9': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    '5p9gwh5k': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'm0zdsbqh': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'gema5pam': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    '54ufvko7': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'u7buysgh': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '1mw2qhrf': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    '88a8c7i4': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '2xuaqgyh': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    '7x9faonq': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '5wguavds': {
      'en': 'Shops',
      'ar': 'محلات ',
    },
  },
  // D-Driver-page
  {
    '9a7xd80j': {
      'en': 'Stop Sharing Location',
      'ar': 'إيقاف مشاركة موقعك',
    },
    'g7b2m9dq': {
      'en': 'This button is only active for drivers',
      'ar': 'هذا الزر نشط فقط للسائقين',
    },
    'zcbcjg8b': {
      'en': 'email:',
      'ar': 'بريد إلكتروني:',
    },
    'f0tngfjv': {
      'en': 'phone',
      'ar': 'هاتف السائق',
    },
    'xjpcm3z6': {
      'en': 'whats',
      'ar': 'واتس السائق',
    },
    'qycnfvit': {
      'en': 'My Deposit:',
      'ar': 'مبلغ التأمين',
    },
    'hrok3pcq': {
      'en': 'My Account',
      'ar': 'حسابي',
    },
    'jsdmtq1i': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'ujzu569x': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'slzd3q0t': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'w4kup6vm': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'ox80tuy0': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'c84b06cp': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    '2nv4ffa6': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    's7tvyuin': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'p1upng8l': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'ptxbgc1k': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'oe88lkza': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '43tth2r4': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'h626gb2j': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '3qd0zb2v': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // E-Register
  {
    'zcszsoln': {
      'en': 'Sign In or Register',
      'ar': ' الدخول أو التسجيل',
    },
    'kw46cakz': {
      'en': 'Note:',
      'ar': 'ملحوظة:',
    },
    'm6o49ypp': {
      'en':
          '   You must sign in before proceeding  to see telephone numbers of the Drivers',
      'ar':
          'يجب عليك تسجيل الدخول قبل المتابعة إلى الخريطة حتى ترى ارقام الهواتف للسائقين',
    },
    'wa3eyl5m': {
      'en':
          ' If you don\'t have an account yet, Please register with your email and password .\nNote: You must sign in before proceeding to checkout. If you don\'t have an account, please register first.',
      'ar':
          'إذا لم يكن لديك حساب بعد، يُرجى التسجيل باستخدام بريدك الإلكتروني وكلمة المرور.\n\nملاحظة: يجب عليك تسجيل الدخول قبل إتمام عملية الشراء. إذا لم يكن لديك حساب، يُرجى التسجيل أولاً.',
    },
    'xhwd8ead': {
      'en': 'Email Authentication',
      'ar': 'مصادقة البريد الإلكتروني',
    },
    'm13p3fs1': {
      'en': 'Enter your email address',
      'ar': 'أدخل عنوان بريدك الإلكتروني',
    },
    'hgtrrp1b': {
      'en': 'Enter your password',
      'ar': 'أدخل كلمة المرور الخاصة بك',
    },
    'k5eljs5u': {
      'en': 'Enter your email address is required',
      'ar': 'أدخل عنوان بريدك الإلكتروني مطلوب',
    },
    'ar4p9z2o': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'm3msazpw': {
      'en': 'Enter your password is required',
      'ar': 'أدخل كلمة المرور الخاصة بك مطلوبة',
    },
    'izi94bhy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'uj2belb7': {
      'en': 'Sign In',
      'ar': 'الدخول',
    },
    '6tx6kvkb': {
      'en':
          'If you don\'t have an account yet, Please register with your email and password .',
      'ar':
          'إذا لم يكن لديك حساب حتى الآن، يرجى التسجيل باستخدام بريدك الإلكتروني وكلمة المرور.',
    },
    'm64cotj3': {
      'en':
          ' If you don\'t have an account yet, Please register with your email and password .\nNote: You must sign in before proceeding to checkout. If you don\'t have an account, please register first.',
      'ar':
          'إذا لم يكن لديك حساب بعد، يُرجى التسجيل باستخدام بريدك الإلكتروني وكلمة المرور.\n\nملاحظة: يجب عليك تسجيل الدخول قبل إتمام عملية الشراء. إذا لم يكن لديك حساب، يُرجى التسجيل أولاً.',
    },
    '8mjo4lnt': {
      'en': 'Note:',
      'ar': 'ملحوظة:',
    },
    '12qxipqs': {
      'en':
          ' If you don\'t have an account yet, Please register with your email and password .\nNote: You must sign in before proceeding to checkout. If you don\'t have an account, please register first.',
      'ar':
          'إذا لم يكن لديك حساب بعد، يُرجى التسجيل باستخدام بريدك الإلكتروني وكلمة المرور.\n\nملاحظة: يجب عليك تسجيل الدخول قبل إتمام عملية الشراء. إذا لم يكن لديك حساب، يُرجى التسجيل أولاً.',
    },
    'beqakcoi': {
      'en':
          'Set a new password for this application. For your security, do not enter your email password.\n\n',
      'ar': 'أنشئ كلمة مرور جديدة للتطبيق، وليس كلمة مرور بريدك الإلكتروني',
    },
    '70l16g9f': {
      'en':
          ' If you don\'t have an account yet, Please register with your email and password .\nNote: You must sign in before proceeding to checkout. If you don\'t have an account, please register first.',
      'ar':
          'إذا لم يكن لديك حساب بعد، يُرجى التسجيل باستخدام بريدك الإلكتروني وكلمة المرور.\n\nملاحظة: يجب عليك تسجيل الدخول قبل إتمام عملية الشراء. إذا لم يكن لديك حساب، يُرجى التسجيل أولاً.',
    },
    'fa4grp77': {
      'en': 'Register',
      'ar': 'التسجيل',
    },
    'c90gga92': {
      'en': 'Foregate your password?  ',
      'ar': 'نسيت كلمة المرور الخاصة بك؟',
    },
    'ddmnfnpw': {
      'en': 'type here to reset ',
      'ar': 'اكتب هنا لإعادة التعيين',
    },
    'p29b1vy4': {
      'en': 'Register',
      'ar': 'التسجيل',
    },
    'pzhnics2': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    '31zdkiev': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    '7vo7m3kw': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'm4z9mm3f': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'ldu0jmow': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'pkfvv46t': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    '33kwkryd': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'wzgalayw': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'axgui7xx': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'hyh4wzwy': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'fc8l9b4l': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'x9wnvcu1': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'bkd81acs': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '0evlb3k4': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
  },
  // F-Settings
  {
    't5b8mkoq': {
      'en': 'Enter your country',
      'ar': '',
    },
    'darmz7q7': {
      'en': 'Search...',
      'ar': '',
    },
    'hyw7srax': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب',
    },
    '7snzztny': {
      'en':
          'Deleting your account will permanently erase all your data and authentication. This action cannot be undone. To use the app again, you must register with a new email address.',
      'ar':
          'سيؤدي حذف حسابك إلى مسح جميع بياناتك ومعلومات المصادقة نهائيًا. لا يمكن التراجع عن هذا الإجراء. لاستخدام التطبيق مرة أخرى، يجب عليك التسجيل باستخدام بريد إلكتروني جديد.',
    },
    'nh8wobg5': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    '9sh8ykzd': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    '5q59ega0': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'l57j41ck': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'gyi7eboe': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '404yt2av': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    '48h7qdlg': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'losbzr2a': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'drkdd2oc': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'hgls8k0l': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    '0li9y6we': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'y0oixup4': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'lmxql6t3': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '90leia9u': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'zdjd2lzw': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'yw244iiw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // G_Contactus
  {
    'do1ui8y8': {
      'en': '      WhatsApp: +971-56-4814838',
      'ar': '      WhatsApp: +971-56-4814838',
    },
    'zdisolkl': {
      'en': '       Email: support@laserfze.com',
      'ar': 'البريد الإلكتروني: support@laserfze.com',
    },
    'x7clj73x': {
      'en':
          'Phone: +971-XXX-XXXXXX\n\nEmail: support@yourapp.com\n\nLocation: Ajman, United Arab Emirates\n                       Free zone.\n\nWorking Hours: Mon–Fri, 9:00 AM – 5:00 PM\n\n',
      'ar':
          'الهاتف: 971-XXX-XXXXXX+\n\nالبريد الإلكتروني: support@yourapp.com\n\nالموقع: عجمان، الإمارات العربية المتحدة\nالمنطقة الحرة\n\nساعات العمل: من الإثنين إلى الجمعة، من الساعة 9:00 صباحًا إلى 5:00 مساءً',
    },
    '54s47qhw': {
      'en': 'Location: \nFree zone Ajman, United Arab Emirates. ',
      'ar': 'الموقع: المنطقة الحرة، عجمان، الإمارات العربية المتحدة.',
    },
    'ny5uggz4': {
      'en':
          'Phone: +971-XXX-XXXXXX\n\nEmail: support@yourapp.com\n\nLocation: Ajman, United Arab Emirates\n                       Free zone.\n\nWorking Hours: Mon–Fri, 9:00 AM – 5:00 PM\n\n',
      'ar':
          'الهاتف: 971-XXX-XXXXXX+\n\nالبريد الإلكتروني: support@yourapp.com\n\nالموقع: عجمان، الإمارات العربية المتحدة\nالمنطقة الحرة\n\nساعات العمل: من الإثنين إلى الجمعة، من الساعة 9:00 صباحًا إلى 5:00 مساءً',
    },
    '0e9p4r4s': {
      'en': 'Working Hours: \nMon–Fri, 9:00 AM – 5:00 PM',
      'ar':
          'ساعات العمل: من الإثنين إلى الجمعة، من الساعة 9:00 صباحًا حتى 5:00 مساءً',
    },
    'oq3v4yyf': {
      'en':
          'Phone: +971-XXX-XXXXXX\n\nEmail: support@yourapp.com\n\nLocation: Ajman, United Arab Emirates\n                       Free zone.\n\nWorking Hours: Mon–Fri, 9:00 AM – 5:00 PM\n\n',
      'ar':
          'الهاتف: 971-XXX-XXXXXX+\n\nالبريد الإلكتروني: support@yourapp.com\n\nالموقع: عجمان، الإمارات العربية المتحدة\nالمنطقة الحرة\n\nساعات العمل: من الإثنين إلى الجمعة، من الساعة 9:00 صباحًا إلى 5:00 مساءً',
    },
    '4gv2pvxw': {
      'en': 'www.laserfze.com',
      'ar': 'www.laserfze.com',
    },
    '4p55830o': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    '195tbpc6': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    '62iwgp4z': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'mbid13rq': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'wsqywwq5': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'xwpix6va': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    '1nnsf7bh': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'vk3qs9xe': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    '7w09wpbs': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'qkshk1gu': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'djuf67v1': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'lenva98w': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '34xqv937': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    't2dfh2dw': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '9ajy0gda': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // H_Aboutus
  {
    'zrutd13o': {
      'en': '50%',
      'ar': '50%',
    },
    'fxha33rz': {
      'en': '50%',
      'ar': '50%',
    },
    'r390icid': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    '2jd3n727': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'n9v61hmf': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'kvvim1of': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'l67eunyz': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    '0kfe6yf4': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'gtghznwz': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    '5tszkhhb': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'n5r2axlm': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'aooymgp0': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'd5au26gs': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'cdlr6qjv': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'fz3je9h2': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'tu1fc1r3': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'q2ntsb0f': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // I-Help
  {
    '25gv1rmw': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'ixaxp8g9': {
      'en':
          ' Car Recovery App\n\nHelp & Support – Ride3line App\nGetting Started\nPlease turn ON your phone’s GPS (Location Services) before using the app.\nA stable internet connection is required for the best experience.\nAccount Registration\nWhen you open the app, you will see the registration screen.\nSign up using your email and password to access all features.\nAfter registration, log in to continue.\nFor Users (Passengers / Car Owners)\n\n• Book a Taxi\nRequest a ride by selecting your pickup and destination. Nearby drivers will receive your request and respond.\n\n• Book Car Recovery / Towing\nIf your vehicle breaks down, request a recovery driver. The nearest available drivers will appear on the map.\n\n• Live Map Tracking\nTrack your assigned driver in real time from the moment they accept your request.\n\n• Fleet Tracking\nMonitor your vehicles (cars, trucks, or business fleet) directly on the map with live location updates.\n\n• Family Tracking\nAdd family members and track their locations for safety and convenience.\n\nFor Drivers (Taxi & Recovery Drivers)\n\n• Driver Login Required\nDrivers must log in to access their dashboard and receive ride or recovery requests.\n\n• Go Online / Offline\nUse the toggle button to control your availability:\n\nTurn ON to receive requests\nTurn OFF when you are unavailable or resting\n\n• Live Location Sharing\nWhen online, your location will be visible to users searching for nearby drivers.\n\nMap & Features\n\n• Real-Time Traffic\nThe map displays live traffic conditions to help optimize routes and reduce delays.\n\n• Nearest Driver System\nThe app automatically finds and connects users with the closest available drivers.\n\nSupport Tips\nMake sure GPS is always enabled for accurate tracking.\nEnsure you are connected to the internet.\nKeep the app updated for the latest features and improvements.',
      'ar':
          'المساعدة والدعم \n\nالبدء\nيرجى تشغيل خدمة تحديد الموقع (GPS) في هاتفك قبل استخدام التطبيق.\nيُفضّل توفر اتصال إنترنت مستقر للحصول على أفضل تجربة.\n\nتسجيل الحساب\nعند فتح التطبيق، ستظهر لك شاشة التسجيل.\nقم بالتسجيل باستخدام بريدك الإلكتروني وكلمة المرور للوصول إلى جميع الميزات.\nبعد التسجيل، قم بتسجيل الدخول للمتابعة.\n\nللمستخدمين (الركاب / مالكي السيارات)\n\n• حجز تاكسي\nاطلب رحلة عن طريق تحديد موقع الانطلاق والوجهة. سيستلم السائقون القريبون طلبك ويقومون بالرد.\n\n• طلب سطحة / سحب مركبة\nفي حال تعطل مركبتك، يمكنك طلب سائق استعادة. سيظهر أقرب السائقين المتاحين على الخريطة.\n\n• تتبع مباشر على الخريطة\nيمكنك تتبع السائق المخصص لك بشكل مباشر منذ لحظة قبوله للطلب.\n\n• تتبع الأسطول\nراقب مركباتك (سيارات، شاحنات، أو أسطول العمل) مباشرة على الخريطة مع تحديثات الموقع الحية.\n\n• تتبع العائلة\nأضف أفراد العائلة وتابع مواقعهم لزيادة الأمان والراحة.\n\nللسائقين (سائقي التاكسي وسائقي السطحات)\n\n• تسجيل دخول السائق مطلوب\nيجب على السائق تسجيل الدخول للوصول إلى لوحة التحكم واستلام الطلبات.\n\n• تشغيل / إيقاف الحالة\nاستخدم زر التبديل للتحكم في حالتك:\n\nتشغيل (ON) لاستقبال الطلبات\nإيقاف (OFF) عند عدم التوفر أو أثناء الراحة\n\n• مشاركة الموقع المباشر\nعند تفعيل الحالة (Online)، سيكون موقعك مرئيًا للمستخدمين الباحثين عن سائقين قريبين.\n\nالخريطة والميزات\n\n• حالة المرور المباشرة\nتعرض الخريطة حالة المرور بشكل مباشر لمساعدتك في اختيار أفضل الطرق وتقليل التأخير.\n\n• نظام أقرب سائق\nيقوم التطبيق تلقائيًا بالعثور على أقرب السائقين المتاحين وربطهم بالمستخدمين.\n\nنصائح الدعم\nتأكد من تشغيل GPS دائمًا للحصول على دقة عالية في التتبع.\nتأكد من الاتصال بالإنترنت.\nاحرص على تحديث التطبيق للحصول على أحدث الميزات والتحسينات.',
    },
    'jptgydjc': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'h5bzywvc': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'piz6rh8x': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '39rj9f2t': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'zyowacbf': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'jm31x3az': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'vyu5jdvs': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    't9ltwxui': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'sod213bg': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '9a5e2118': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'wk149y8z': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'nz37kx2q': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'j410z36n': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'r5iw05rz': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // J-Logout
  {
    'dpuw153u': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'nhwg20rt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // K-Admin
  {
    'l4uzzhbc': {
      'en': 'Enter email:',
      'ar': 'أدخل البريد الإلكتروني:',
    },
    'kexekuk2': {
      'en': 'Enter email..........',
      'ar': 'أدخل البريد الإلكتروني..........',
    },
    'uktc05pt': {
      'en': 'Enter email',
      'ar': 'إدخال',
    },
    'lf16qe88': {
      'en': 'Logout',
      'ar': 'خروج',
    },
    'hp2rhuqt': {
      'en': 'email:',
      'ar': 'بريد إلكتروني:',
    },
    'cctfceef': {
      'en': 'driver_phone',
      'ar': 'هاتف السائق',
    },
    'w93hc4nz': {
      'en': 'driver_whats',
      'ar': 'واتس السائق',
    },
    '2l2n98u8': {
      'en': 'ADD.created_time',
      'ar': 'وقت إنشاء الإعلان',
    },
    'fsggxvi8': {
      'en': 'ADD.end_time',
      'ar': 'وقت الإنتهاء',
    },
    '2pqsre5n': {
      'en': 'Remaining time',
      'ar': 'الوقت المتبقي',
    },
    'r6vkvhii': {
      'en': ' Map  Status  (Payment)',
      'ar': 'ضبط حالة الدفع عبر الإنترنت',
    },
    'yhvrojla': {
      'en': 'driver_phone',
      'ar': 'هاتف السائق',
    },
    'vqwbai0o': {
      'en': '',
      'ar': '',
    },
    '4ay5apma': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'zgu64grg': {
      'en': 'driver_whats',
      'ar': 'واتس السائق',
    },
    'cpwsncu7': {
      'en': '',
      'ar': '',
    },
    'nsrfa6zw': {
      'en': 'TextField',
      'ar': ' النص',
    },
    '3e1nq7ju': {
      'en': 'Remaining time',
      'ar': 'الوقت المتبقي',
    },
    'yh1x5e0x': {
      'en': 'ADD.created_time',
      'ar': 'وقت إنشاء الإعلان',
    },
    '83rlf8na': {
      'en': 'Pick',
      'ar': 'إدخال',
    },
    '5k7qjucp': {
      'en': 'ADD.end_time',
      'ar': 'بريد إلكتروني:',
    },
    'bcos2waw': {
      'en': 'Pick',
      'ar': 'إدخال',
    },
    'dww6u8x5': {
      'en': 'Update data',
      'ar': 'إدخال',
    },
    '6h6ntzy7': {
      'en': 'Submit',
      'ar': 'إدخال',
    },
    'us3pqnoc': {
      'en': 'TextField is required',
      'ar': '',
    },
    '92115e0a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'eaghmwyh': {
      'en': 'TextField is required',
      'ar': '',
    },
    'cebexn3h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '60m913xl': {
      'en': 'Create Repairing Shops',
      'ar': 'إنشاء محلات إصلاحالسيارات',
    },
    '2rjqg76f': {
      'en': '1-Create Record',
      'ar': '1- إنشاء سجل',
    },
    '4tzbqx90': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'js18rp3x': {
      'en': 'shop_name',
      'ar': '',
    },
    'newuza5w': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'jmy9ay68': {
      'en': 'TextField',
      'ar': ' النص',
    },
    'sy9ptsk1': {
      'en': '',
      'ar': '',
    },
    'ua0y3p3j': {
      'en': 'shop_name',
      'ar': 'اسم المتجر',
    },
    '7l97mohp': {
      'en': 'shop_name',
      'ar': '',
    },
    '03akblti': {
      'en': 'shop_name',
      'ar': 'اسم المتجر',
    },
    '71vu2ca5': {
      'en': 'TextField',
      'ar': ' النص',
    },
    'v5pbut1c': {
      'en': 'Specialist',
      'ar': 'اأـتخصص',
    },
    'o3v2xr8j': {
      'en': 'Specialist',
      'ar': 'اأـتخصص',
    },
    'lgahqb00': {
      'en': 'Specialist',
      'ar': 'اأـتخصص',
    },
    '5xwv1rrk': {
      'en': 'TextField',
      'ar': ' النص',
    },
    'eouzeq28': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    '1vk2flf2': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'x1q00a30': {
      'en': 'Details',
      'ar': 'تفاصيل',
    },
    'js0qypsd': {
      'en': 'TextField',
      'ar': ' النص',
    },
    'drx3q00p': {
      'en': 'phone',
      'ar': 'الهاتف',
    },
    'sg2r2ffm': {
      'en': 'Details',
      'ar': '',
    },
    'x948lu4a': {
      'en': 'phone',
      'ar': 'هاتف',
    },
    '0cm5nxhb': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'exd1igj2': {
      'en': 'Whats',
      'ar': 'Whats',
    },
    'hzreikmu': {
      'en': 'Details',
      'ar': '',
    },
    'x2kbojnx': {
      'en': 'Whats',
      'ar': 'واتس',
    },
    'otrsj5z3': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'dqejbb96': {
      'en': '',
      'ar': '',
    },
    'kbb8lu6t': {
      'en': 'Image',
      'ar': 'الصورة',
    },
    'lnug6om8': {
      'en': 'shop_name is required',
      'ar': '',
    },
    'anrvhqup': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2q84dpf6': {
      'en': 'Specialist is required',
      'ar': '',
    },
    'd3mtyd4x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0mv8cya0': {
      'en': 'Details is required',
      'ar': '',
    },
    '6315nene': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jcrdehhk': {
      'en': 'email is required',
      'ar': '',
    },
    'x5hk7k7h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ldb9gfpi': {
      'en': 'email is required',
      'ar': '',
    },
    'hkoz0htt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x1zyaqlf': {
      'en': 'email is required',
      'ar': '',
    },
    'tcin1xly': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lzyi2tep': {
      'en': 'email is required',
      'ar': '',
    },
    'm5lbwqql': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'iwg8b9by': {
      'en': 'Create mechanical shop ACC',
      'ar': 'إنشاء ورشة ميكانيك ACC',
    },
    'x6dt572l': {
      'en': '2-Update Record',
      'ar': '',
    },
    'xrmbf3w8': {
      'en': 'shop_name',
      'ar': '',
    },
    'm2018umx': {
      'en': 'shop_name',
      'ar': '',
    },
    'e05axwi5': {
      'en': 'shop_name update',
      'ar': 'تحديث اسم المتجر',
    },
    '0aly5mj0': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'ab2wkw47': {
      'en': 'Specialist',
      'ar': '',
    },
    'z029h19j': {
      'en': 'Specialist',
      'ar': '',
    },
    't3dmakjq': {
      'en': 'Specialist',
      'ar': 'الـتخصص',
    },
    'l5ts3u8h': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'hxdl7f3z': {
      'en': 'Details',
      'ar': '',
    },
    'eoj2chom': {
      'en': 'Details',
      'ar': '',
    },
    'jpollne2': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    'r5vqiu6t': {
      'en': 'TextField',
      'ar': 'النص',
    },
    '9rubt169': {
      'en': 'phone',
      'ar': '',
    },
    'ouh1r85m': {
      'en': 'Details',
      'ar': '',
    },
    'ay5z4r3b': {
      'en': 'Phone',
      'ar': 'الهاتف',
    },
    'gek5ixxv': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'rymux4br': {
      'en': 'whats',
      'ar': '',
    },
    'sja9oono': {
      'en': 'Details',
      'ar': '',
    },
    'cj1wmt6j': {
      'en': 'Whats',
      'ar': 'واتس',
    },
    'qsagy28l': {
      'en': 'TextField',
      'ar': 'النص',
    },
    'ogrwu7jj': {
      'en': 'ADD.created_time',
      'ar': '',
    },
    '2dvk7ql9': {
      'en': 'Pick',
      'ar': 'إدخال',
    },
    'j36yfygb': {
      'en': 'ADD.end_time',
      'ar': '',
    },
    'qd89ofl4': {
      'en': 'Pick',
      'ar': 'إدخال',
    },
    'ocp9avtf': {
      'en': 'Update data',
      'ar': 'إدخال',
    },
    '2w3y7ohw': {
      'en': 'Remaining time',
      'ar': '',
    },
    'mjezajzq': {
      'en': ' Shop  Status  (Payment)',
      'ar': 'ضبط حالة الدفع عبر الإنترنت',
    },
    'vb9rk9l3': {
      'en': 'Image',
      'ar': '',
    },
    '37cmq95c': {
      'en': 'shop_name is required',
      'ar': '',
    },
    '3obtpgc3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0mkf9q6c': {
      'en': 'Specialist is required',
      'ar': '',
    },
    'zg363q5z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qooh5wbb': {
      'en': 'Details is required',
      'ar': '',
    },
    'clb7sjuz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0ujyrwb7': {
      'en': 'email is required',
      'ar': '',
    },
    'vqdopxyq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9q7npee4': {
      'en': 'email is required',
      'ar': '',
    },
    'b8nyxz83': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '702nt3r0': {
      'en': 'email is required',
      'ar': '',
    },
    'o475xlo0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'pmp25y0l': {
      'en': 'email is required',
      'ar': '',
    },
    'slnsrvlu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ehugvqvh': {
      'en': 'Update mechanical shop ACC',
      'ar': 'إدخال',
    },
    '7beoxd90': {
      'en': 'Admin page',
      'ar': 'صفحة المدير',
    },
    'lt1drywk': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    '3bozl52c': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'ghtfhcgk': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'g754h9tk': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'tmhv1d44': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'ogkrykut': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    '6gktslt7': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'x1m517zh': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'k2gvgapg': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'gc7xi53f': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'j03w1kme': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'ifea8jwu': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'pf2bpytu': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'im9c26tp': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // M-workshop_Details
  {
    '8u40n3gy': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'jacdrngw': {
      'en': 'Phone',
      'ar': 'الهاتف',
    },
    '9ui4sdpx': {
      'en': 'Whats',
      'ar': 'واتس',
    },
    'rnvr1tyk': {
      'en': 'Specialist',
      'ar': 'الإختصاص',
    },
    'vix8qy2u': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    'vkt30bhz': {
      'en': 'Details',
      'ar': 'التفاصيل',
    },
    'ijdijwju': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // B2-Taxi
  {
    'xm3oetqy': {
      'en': '',
      'ar': '',
    },
    'wkp56lwj': {
      'en': 'New Booking',
      'ar': 'أدخل وجهتك',
    },
    'cdj94ute': {
      'en': 'Book a taxi ride here.',
      'ar': 'إحجز مركبة تكسي هنا',
    },
    '29j636zi': {
      'en': 'Please select a country in Settings.',
      'ar': 'يرجى اختيار الدولة من الإعدادات.',
    },
    'zfrq9sb3': {
      'en': 'Please select a country \nin Settings.',
      'ar': 'يرجى اختيار الدولة من الإعدادات.',
    },
    'x5c039cl': {
      'en': 'Taxi ',
      'ar': ' سيارات الأجرة',
    },
    'uwxvp5y6': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    '3nrinpie': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'w0h192nr': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'd6zxs6jw': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'ztugmcka': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'x1yfclxz': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    '4e7wdd7j': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'j70kyxr1': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'kuhqnccf': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'xoffiv25': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'qgwgb351': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'tjpx2kry': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'ciza2jt4': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'm0kjpod2': {
      'en': 'Taxi',
      'ar': 'سيارات الأجرة',
    },
  },
  // B3-GoogleMap-MyDrivers
  {
    'a0wpriik': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'a731hc4o': {
      'en': '50%',
      'ar': '50%',
    },
    'qmk5iy3l': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'nnjwwddi': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    '2qjuco9d': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'ni836yc6': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'ojsu7ewb': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'cxr13nrc': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'bj8ovfmt': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'm7e9xfli': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'yh1rvvuv': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '09n0kzor': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    '3qnizsb9': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'f3otxodh': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'p5hemusr': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'xzl7g44l': {
      'en': 'My Drivers',
      'ar': 'سائقي',
    },
  },
  // N-Destination_map
  {
    '2vxrlqrr': {
      'en': 'Pin Location',
      'ar': '',
    },
    'axx0w080': {
      'en': '1- Confirm destination',
      'ar': '1-تأكيد موقع الوصول',
    },
    'n4hn6ooj': {
      'en': '2- Book a ride',
      'ar': '2-احجز الآن',
    },
    '2c5g7glv': {
      'en': 'Select destination',
      'ar': 'إختيار موقع الوصول',
    },
    'ua1nu11d': {
      'en': 'Confirm',
      'ar': 'أ وافق',
    },
    'yt3uzsys': {
      'en': 'My destination',
      'ar': 'وجهتي',
    },
  },
  // O1-Booking_page
  {
    '47lrix63': {
      'en': 'Your location :',
      'ar': 'موقعك:',
    },
    'cz039nby': {
      'en': 'Current location',
      'ar': 'الموقع الحالي',
    },
    'lqnbldiq': {
      'en': 'Your Destination :',
      'ar': 'وجهتك:',
    },
    'aqt6d9ur': {
      'en': 'Distance KM :',
      'ar': 'المسافة بالكيلومترات:',
    },
    'i6ozcwnb': {
      'en': 'Estimated Duration MINS:',
      'ar': 'المدة التقديرية بالدقائق:',
    },
    'nvoo3fil': {
      'en': 'Estimated average price  :',
      'ar': 'متوسط ​​السعر المُقدّر:',
    },
    '46vgyqcp': {
      'en': 'Initial price:',
      'ar': 'السعر الأولي:',
    },
    'yrzpsdv6': {
      'en': 'Trip total:',
      'ar': 'إجمالي الرحلة:',
    },
    'zwt3v7mz': {
      'en': 'Confirm your Order ',
      'ar': 'أكد طلبك ',
    },
    'j41xeeu7': {
      'en': 'Booking details',
      'ar': 'تفاصيل الحجز',
    },
  },
  // P1-Customer--Taxi-Page
  {
    '1bagu3ta': {
      'en': '50%',
      'ar': '50%',
    },
    'cmfbtcze': {
      'en': 'My location',
      'ar': 'موقعي',
    },
    'lohfzm2a': {
      'en': 'My Destination',
      'ar': 'وجهتي',
    },
    'runpmpyw': {
      'en': '',
      'ar': '',
    },
    '5bmqdej0': {
      'en': 'Show ride details',
      'ar': 'عرض تفاصيل الرحلة',
    },
    '5d8vr2ny': {
      'en': 'I have arrived',
      'ar': 'لقد وصلت',
    },
    'ldwiqgj3': {
      'en': 'Customer page',
      'ar': 'صفحة الزبون',
    },
    '14soh4lj': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'nfaj473n': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    '5s8q5wsf': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    'cm00nstb': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'th0kpy9s': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'ngy1vtwk': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'spjeplzt': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    '4alsjpwl': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    '3e242slr': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'yp7ghf5l': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'xnyos90u': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'gew7mhs1': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'n6g6uek0': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'qe8s722x': {
      'en': 'Taxi',
      'ar': 'سيارات الأجرة',
    },
  },
  // Q1-Taxi-driver_page
  {
    'pfw7rlu3': {
      'en': '50%',
      'ar': '50%',
    },
    'a0nm0ajy': {
      'en': 'My Destination',
      'ar': 'وجهتي',
    },
    '7nsofeyi': {
      'en': 'Customer location',
      'ar': 'موقع الزبون',
    },
    'c09dpenm': {
      'en': '',
      'ar': '',
    },
    'lvf3daj0': {
      'en': 'A new order is coming.',
      'ar': 'الطلب',
    },
    'hmvxz60z': {
      'en': 'Customer Id',
      'ar': 'معرف العميل',
    },
    'td1di1zd': {
      'en': 'Drop Address',
      'ar': 'عنوان الوصول',
    },
    'b30l8ams': {
      'en': 'Order Distance Km',
      'ar': 'مسافة الطلب (كم)',
    },
    'orvi8uk6': {
      'en': 'Order Est. Time',
      'ar': 'الوقت المتوقع للطلب',
    },
    'zhm4nv43': {
      'en': 'Est. Total Price',
      'ar': 'السعر الإجمالي التقريبي',
    },
    '2y3vx8bs': {
      'en': 'Customer Distance Km',
      'ar': 'مسافة العميل (كم)',
    },
    'es43vdt9': {
      'en': 'Accept',
      'ar': 'قبول',
    },
    'hi0iamjx': {
      'en': 'Refuse',
      'ar': 'إلغاء',
    },
    'hm80rdif': {
      'en': 'Show ride details',
      'ar': 'عرض تفاصيل الرحلة',
    },
    'wg4sgrwj': {
      'en': 'Finish the Ride',
      'ar': 'إنهِاء الرحلة',
    },
    'i9prjasa': {
      'en': 'I am here',
      'ar': 'أنا هنا',
    },
    '8y56k798': {
      'en': 'Taxi Driver Page',
      'ar': 'صفحة سائق التكسي',
    },
    '9lbwkigh': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'gwd8feax': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    'oecs0tea': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '27a61nhu': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'yk6s77kp': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'eibtzw5r': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'os3ccyr7': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'bljr73t1': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'dgufv5g3': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '0lpdrl1z': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'ci26v1g3': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'gudt2bli': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'ogl82tn0': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'oubw5l2x': {
      'en': 'Taxi',
      'ar': 'سيارات الأجرة',
    },
  },
  // P2-Customer-Crane-Page
  {
    'nwnsgglg': {
      'en': '50%',
      'ar': '50%',
    },
    'y9okymeb': {
      'en': '',
      'ar': '',
    },
    'i84i2ra2': {
      'en': 'Show ride details',
      'ar': 'عرض تفاصيل الرحلة',
    },
    'izygx6nd': {
      'en': 'My location',
      'ar': 'موقعي',
    },
    '3z4v0pob': {
      'en': 'My Destination',
      'ar': 'وجهتي',
    },
    'xhtupn3b': {
      'en': 'I have arrived',
      'ar': 'لقد وصلت',
    },
    'wc5pqx13': {
      'en': 'Customer page',
      'ar': 'صفحة الزبون',
    },
    'zc7xp44v': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'ggjcz3q3': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    '45itkwdj': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '4r85mpjq': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'ke8kkflo': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    'apnr1yel': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'ogladm8i': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    'eaafgmtw': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    '8vc8caal': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    '5epccd1g': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'nqp17pac': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'djedxa0s': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'q36k3sy5': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'riod4cbi': {
      'en': 'Taxi',
      'ar': 'سيارات الأجرة',
    },
  },
  // Q2-Crane-driver_page
  {
    'ymc7phoq': {
      'en': '50%',
      'ar': '50%',
    },
    'aeveg180': {
      'en': 'My Destination',
      'ar': 'وجهتي',
    },
    '0al6l8lu': {
      'en': 'Customer location',
      'ar': 'موقع الزبون',
    },
    'equbww22': {
      'en': '',
      'ar': '',
    },
    '90dmb9zy': {
      'en': 'A new order is coming.',
      'ar': 'الطلب',
    },
    '7s2vzqx5': {
      'en': 'Customer Id',
      'ar': 'معرف العميل',
    },
    'xdx9eidf': {
      'en': 'Drop Address',
      'ar': 'عنوان الوصول',
    },
    '00tdpvlx': {
      'en': 'Order Distance Km',
      'ar': 'مسافة الطلب (كم)',
    },
    'jxrhjux4': {
      'en': 'Order Est. Time',
      'ar': 'الوقت المتوقع للطلب',
    },
    '6koxbn3d': {
      'en': 'Est. Total Price',
      'ar': 'السعر الإجمالي التقريبي',
    },
    'zgbosbqd': {
      'en': 'Customer Distance Km',
      'ar': 'مسافة العميل (كم)',
    },
    'ravthjrz': {
      'en': 'Accept',
      'ar': 'قبول',
    },
    '5ssp0rph': {
      'en': 'Refuse',
      'ar': 'إلغاء',
    },
    '7bi1ca5h': {
      'en': 'Show ride details',
      'ar': 'عرض تفاصيل الرحلة',
    },
    'shbxgpz8': {
      'en': 'Finish the Ride',
      'ar': 'إنهِاء الرحلة',
    },
    'defs772e': {
      'en': 'I am here',
      'ar': 'أنا هنا',
    },
    'x8rxfno2': {
      'en': 'Crane Driver Page',
      'ar': 'صفحة سائق الرافعة',
    },
    'iuv4j6nn': {
      'en': 'Map',
      'ar': 'الخريطة',
    },
    'z57ckg3r': {
      'en': 'My Taxi Booking',
      'ar': 'حجوزاتي تكسي',
    },
    '7hp51jyf': {
      'en': 'My Crane Booking',
      'ar': 'حجوزاتي رافعة',
    },
    '5wkdizey': {
      'en': 'Taxi page  ',
      'ar': 'صفحة سائقي التاكسي',
    },
    'td916krf': {
      'en': 'Crane page  ',
      'ar': 'صفحة سائقي الرافعات',
    },
    '7jfkvs4l': {
      'en': 'Register',
      'ar': 'تسجيل الدخول',
    },
    'tpjj3lp3': {
      'en': 'My Acc.',
      'ar': 'حسابي',
    },
    '85lqjfo1': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    '7tbmh808': {
      'en': 'Admin.',
      'ar': 'مسؤل التطبيق',
    },
    'zjdcy6q2': {
      'en': 'Contact us',
      'ar': 'اتصل بنا',
    },
    'otmyn76b': {
      'en': 'About us',
      'ar': 'معلومات عنا',
    },
    'eda4ngxa': {
      'en': 'Help',
      'ar': 'مساعدة',
    },
    'ts4lpqdc': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    '97plc05z': {
      'en': 'Taxi',
      'ar': 'سيارات الأجرة',
    },
  },
  // L-Driver-sheet
  {
    'pn50e36d': {
      'en': 'driver_phone:',
      'ar': 'هاتف السائق:',
    },
    'ma9kpr71': {
      'en': 'driver_whats:',
      'ar': 'واتس السائق::',
    },
    'kcvz9eo6': {
      'en': 'driver_Email:',
      'ar': 'البريد الإلكتروني للسائق:',
    },
  },
  // Tokeninput
  {
    'mifnw8wo': {
      'en': 'Last  Token:',
      'ar': 'الرمز الأخير:',
    },
    'f6eeflfq': {
      'en': 'Press to skip',
      'ar': 'اضغط للتخطي',
    },
    'w9ykgcal': {
      'en': 'Enter new Token or skip\n',
      'ar': 'أدخل الرمز الجديد أو تخطَّ .',
    },
    'qy0oeihw': {
      'en': '',
      'ar': '',
    },
    's0vymltm': {
      'en': 'Enter',
      'ar': 'أدخل',
    },
  },
  // Who_taketheorder
  {
    'kz3qek8b': {
      'en': 'Waiting for drivers',
      'ar': 'في انتظار السائق',
    },
    'fjisrl9z': {
      'en': 'Driver Id :',
      'ar': 'معرف السائق :',
    },
    'qw81b9mq': {
      'en': 'Driver phone :',
      'ar': 'هاتف السائق :',
    },
    '9dbacqvo': {
      'en': 'Plate-NO :',
      'ar': 'رقم اللوحة :',
    },
    'vs79l8by': {
      'en': 'Car-type :',
      'ar': 'نوع السيارة :',
    },
    '3my4vupi': {
      'en': 'Your Destination :',
      'ar': 'وجهتك :',
    },
    'w5h6yccj': {
      'en': 'Distance KM :',
      'ar': 'المسافة بالكيلومترات :',
    },
    'vt92pe9f': {
      'en': 'Estimated Duration /mins :',
      'ar': 'المدة المقدرة :',
    },
    '3ovyht1s': {
      'en': 'Est. Total Price :',
      'ar': 'السعر الإجمالي التقريبي :',
    },
    'ux4jkfdt': {
      'en': 'Current Ride Id :',
      'ar': 'معرف الرحلة الحالي :',
    },
    'kixwdzlx': {
      'en': 'Driver Distance :',
      'ar': 'بعد السائق  :',
    },
    'jgwj73lk': {
      'en': 'Km',
      'ar': 'كيلومترات',
    },
    '91xb4sak': {
      'en': 'Dismiss',
      'ar': 'خروج',
    },
  },
  // Taxi_order
  {
    'l44o98qg': {
      'en': 'Driver Id :',
      'ar': 'معرف السائق :',
    },
    '0ck6x5od': {
      'en': 'Driver phone :',
      'ar': 'هاتف السائق :',
    },
    '4oe0pnzl': {
      'en': 'Plate-NO :',
      'ar': 'رقم اللوحة :',
    },
    '50wxj19u': {
      'en': 'Car-type :',
      'ar': 'نوع السيارة :',
    },
    '5pzm2e4g': {
      'en': 'Your Destination :',
      'ar': 'الوجهة : ',
    },
    'g35ht78k': {
      'en': 'Distance KM :',
      'ar': 'المسافة بالكيلومترات:',
    },
    '3ot0pr7s': {
      'en': 'Estimated Duration /mins :',
      'ar': 'المدة المقدرة :',
    },
    'pz5xq2vx': {
      'en': 'Est. Total Price :',
      'ar': 'السعر الإجمالي التقريبي :',
    },
    'fgmq1biu': {
      'en': 'Current Ride Id :',
      'ar': 'معرف الرحلة الحالي :',
    },
    '3lgx7zs7': {
      'en': 'Driver Distance :',
      'ar': 'بعد السائق :',
    },
    '1x25qa9t': {
      'en': 'Km',
      'ar': 'كيلومترات',
    },
    'fodxljqg': {
      'en': 'Dismiss',
      'ar': 'خروج',
    },
  },
  // Nobody_taxi_taketheorder
  {
    't619zufx': {
      'en': 'All drivers are busy\nright now. Please try\nagain in a moment.',
      'ar': 'جميع السائقين مشغولون\nالآن. يرجى المحاولة مرة\n أخرى بعد لحظات.',
    },
    '9vx1tk4x': {
      'en': 'New booking',
      'ar': 'حجز جديد',
    },
  },
  // Nobody_crane_taketheorder
  {
    '8pgz9mfy': {
      'en': 'All drivers are busy\nright now. Please try\nagain in a moment.',
      'ar': 'جميع السائقين مشغولون\nالآن. يرجى المحاولة مرة\n أخرى بعد لحظات.',
    },
    '8wni7yqr': {
      'en': 'New booking',
      'ar': 'حجز جديد',
    },
  },
  // Crane_order
  {
    'dlga5ic6': {
      'en': 'Driver Id :',
      'ar': 'معرف السائق :',
    },
    'xi7niqzl': {
      'en': 'Driver phone :',
      'ar': 'هاتف السائق :',
    },
    'no5ok42b': {
      'en': 'Plate-NO :',
      'ar': 'رقم اللوحة :',
    },
    'zobsq1t8': {
      'en': 'Car-type :',
      'ar': 'نوع السيارة :',
    },
    'bt1kcir4': {
      'en': 'Your Destination :',
      'ar': 'الوجهة : ',
    },
    't07e2u0f': {
      'en': 'Distance KM :',
      'ar': 'المسافة بالكيلومترات:',
    },
    'a8cr4qbp': {
      'en': 'Estimated Duration /mins :',
      'ar': 'المدة المقدرة :',
    },
    'd5015cqw': {
      'en': 'Est. Total Price :',
      'ar': 'السعر الإجمالي التقريبي :',
    },
    'caxmeqyz': {
      'en': 'Current Ride Id :',
      'ar': 'معرف الرحلة الحالي :',
    },
    'n8qyeudu': {
      'en': 'Driver Distance :',
      'ar': 'بعد السائق :',
    },
    'gkeqsvdw': {
      'en': 'Km',
      'ar': 'كيلومترات',
    },
    'dow779s3': {
      'en': 'Dismiss',
      'ar': 'خروج',
    },
  },
  // Miscellaneous
  {
    'li037p08': {
      'en':
          'We use your location while the app is in use to display your position on the map and to help you find nearby car recovery and mechanic services.\n',
      'ar': '',
    },
    'wugghyvr': {
      'en': '',
      'ar': '',
    },
    'l6k0ectk': {
      'en': '',
      'ar': '',
    },
    '8ulon2uz': {
      'en':
          'This app may request access to location services to show your position on the map and to find nearby car recovery and mechanic services while you are using the app. Location is not collected or shared when the app is closed or when you sign out.',
      'ar': '',
    },
    'sf7j768d': {
      'en': '',
      'ar': '',
    },
    'ogxcpllb': {
      'en': '',
      'ar': '',
    },
    'fuimqtyg': {
      'en': '',
      'ar': '',
    },
    'usi4o282': {
      'en': '',
      'ar': '',
    },
    'avy3m38t': {
      'en': '',
      'ar': '',
    },
    'mluuhezz': {
      'en': '',
      'ar': '',
    },
    'bkgztnfd': {
      'en': '',
      'ar': '',
    },
    'kdp1215k': {
      'en': '',
      'ar': '',
    },
    'ib05efm2': {
      'en': '',
      'ar': '',
    },
    'vicre8wn': {
      'en': '',
      'ar': '',
    },
    'xwxy3hqf': {
      'en': '',
      'ar': '',
    },
    'qmtaxiwi': {
      'en': '',
      'ar': '',
    },
    '5ejkvszs': {
      'en': '',
      'ar': '',
    },
    '4wint7oj': {
      'en': '',
      'ar': '',
    },
    '8azjtw9a': {
      'en': '',
      'ar': '',
    },
    '920uz7xr': {
      'en': '',
      'ar': '',
    },
    'tw1hehdo': {
      'en': '',
      'ar': '',
    },
    '4x6h7y5z': {
      'en': '',
      'ar': '',
    },
    'dpvou3lt': {
      'en': '',
      'ar': '',
    },
    'akw3grfm': {
      'en': '',
      'ar': '',
    },
    '8yej3jw1': {
      'en': '',
      'ar': '',
    },
    'dkhv0xxy': {
      'en': '',
      'ar': '',
    },
    'r4615dyu': {
      'en': '',
      'ar': '',
    },
    'ehc4r5in': {
      'en': '',
      'ar': '',
    },
    'uq98zetq': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
