import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yafsa/yafsa/data/core/di/data_locator.dart';
import 'package:yafsa/yafsa/domain/di/domain_locator.dart';
import 'package:yafsa/yafsa/presentation/core/navigation/router/navigation_router.dart';
import 'package:provider/provider.dart';
import 'package:yafsa/yafsa/presentation/core/ui/theme/color/color_palette.dart';
import 'package:yafsa/yafsa/presentation/core/ui/theme/notifier/theme_notifier.dart';
import 'package:yafsa/yafsa/presentation/core/ui/theme/typography/app_typography.dart';

import 'generated/l10n.dart';

void main() async {
  setupSplash();
  await Hive.initFlutter();
  setupLocator();

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

void setupLocator() {
  initializeDataLocator();
  initializeDomainLocator();
}

void setupSplash() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 5));
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', 'US');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString(keyLanguage);
    if (langCode != null) {
      setState(() {
        _locale = _getLocale(langCode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, themeNotifier, child) {
      return MaterialApp.router(
        routerConfig: navigationGraph,
        theme: lightTheme.copyWith(textTheme: byColor(lightTheme.colorScheme)),
        darkTheme:
            darkTheme.copyWith(textTheme: byColor(darkTheme.colorScheme)),
        themeMode: themeNotifier.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en', ''), // English
          Locale('uk', 'UA'), // Ukrainian
        ],
      );
    });
  }

  Locale _getLocale(String? language) {
    switch (language) {
      case 'en':
        return const Locale('en', '');
      case 'uk':
        return const Locale('uk', 'UA');
      default:
        return const Locale('en', '');
    }
  }

  static const String keyLanguage = 'language';
}
