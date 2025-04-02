import 'dart:ui';

class LanguageState {}

class LanguageInitialState extends LanguageState {}

class LanguageLoadingState extends LanguageState {}

class LanguageLoadedState extends LanguageState {
  Locale language;

  LanguageLoadedState(this.language);
}

class LanguageErrorState extends LanguageState {}
