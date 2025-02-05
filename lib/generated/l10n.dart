// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `yet-another-flutter-showcase-app`
  String get application {
    return Intl.message(
      'yet-another-flutter-showcase-app',
      name: 'application',
      desc: '',
      args: [],
    );
  }

  /// `bookstore`
  String get applicationName {
    return Intl.message(
      'bookstore',
      name: 'applicationName',
      desc: '',
      args: [],
    );
  }

  /// `Recommendations`
  String get home_recommendation {
    return Intl.message(
      'Recommendations',
      name: 'home_recommendation',
      desc: '',
      args: [],
    );
  }

  /// `Recently viewed`
  String get home_recent {
    return Intl.message(
      'Recently viewed',
      name: 'home_recent',
      desc: '',
      args: [],
    );
  }

  /// `Type to search`
  String get search_type_to_search {
    return Intl.message(
      'Type to search',
      name: 'search_type_to_search',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get search_empty {
    return Intl.message(
      'No results found',
      name: 'search_empty',
      desc: '',
      args: [],
    );
  }

  /// `Search error`
  String get search_error {
    return Intl.message(
      'Search error',
      name: 'search_error',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang_en {
    return Intl.message('English', name: 'lang_en', desc: '', args: []);
  }

  /// `French`
  String get lang_fr {
    return Intl.message('French', name: 'lang_fr', desc: '', args: []);
  }

  /// `Polish`
  String get lang_pl {
    return Intl.message('Polish', name: 'lang_pl', desc: '', args: []);
  }

  /// `German`
  String get lang_de {
    return Intl.message('German', name: 'lang_de', desc: '', args: []);
  }

  /// `Spanish`
  String get lang_es {
    return Intl.message('Spanish', name: 'lang_es', desc: '', args: []);
  }

  /// `Author(s)`
  String get book_author {
    return Intl.message('Author(s)', name: 'book_author', desc: '', args: []);
  }

  /// `Translator(s)`
  String get book_translators {
    return Intl.message(
      'Translator(s)',
      name: 'book_translators',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get book_description {
    return Intl.message(
      'Description',
      name: 'book_description',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get book_languages {
    return Intl.message(
      'Languages',
      name: 'book_languages',
      desc: '',
      args: [],
    );
  }

  /// `Subjects`
  String get book_subjects {
    return Intl.message('Subjects', name: 'book_subjects', desc: '', args: []);
  }

  /// `Formats`
  String get book_formats {
    return Intl.message('Formats', name: 'book_formats', desc: '', args: []);
  }

  /// `Home`
  String get main_tab_home {
    return Intl.message('Home', name: 'main_tab_home', desc: '', args: []);
  }

  /// `Catalog`
  String get main_tab_catalog {
    return Intl.message(
      'Catalog',
      name: 'main_tab_catalog',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get main_tab_library {
    return Intl.message(
      'Library',
      name: 'main_tab_library',
      desc: '',
      args: [],
    );
  }

  /// `Menu`
  String get main_tab_menu {
    return Intl.message('Menu', name: 'main_tab_menu', desc: '', args: []);
  }

  /// `Type to search`
  String get search_hint {
    return Intl.message(
      'Type to search',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_title {
    return Intl.message('Error', name: 'error_title', desc: '', args: []);
  }

  /// `Something went wrong`
  String get error_message {
    return Intl.message(
      'Something went wrong',
      name: 'error_message',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty_title {
    return Intl.message('Empty', name: 'empty_title', desc: '', args: []);
  }

  /// `No results found`
  String get empty_message {
    return Intl.message(
      'No results found',
      name: 'empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Copyright`
  String get filter_copyright {
    return Intl.message(
      'Copyright',
      name: 'filter_copyright',
      desc: '',
      args: [],
    );
  }

  /// `asc`
  String get filter_asc {
    return Intl.message('asc', name: 'filter_asc', desc: '', args: []);
  }

  /// `This is a showcase app for Flutter. It demonstrates how I would implement a bookstore app.`
  String get about_description {
    return Intl.message(
      'This is a showcase app for Flutter. It demonstrates how I would implement a bookstore app.',
      name: 'about_description',
      desc: '',
      args: [],
    );
  }

  /// `GitHub`
  String get about_github {
    return Intl.message('GitHub', name: 'about_github', desc: '', args: []);
  }

  /// `https://github.com/andrew-malitchuk/yet-another-flutter-showcase-app`
  String get about_github_url {
    return Intl.message(
      'https://github.com/andrew-malitchuk/yet-another-flutter-showcase-app',
      name: 'about_github_url',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get menu_about {
    return Intl.message('About', name: 'menu_about', desc: '', args: []);
  }

  /// `Settings`
  String get menu_settings {
    return Intl.message('Settings', name: 'menu_settings', desc: '', args: []);
  }

  /// `Language`
  String get menu_language {
    return Intl.message('Language', name: 'menu_language', desc: '', args: []);
  }

  /// `Dark mode`
  String get preference_dark_mode {
    return Intl.message(
      'Dark mode',
      name: 'preference_dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get general_next {
    return Intl.message('Next', name: 'general_next', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
