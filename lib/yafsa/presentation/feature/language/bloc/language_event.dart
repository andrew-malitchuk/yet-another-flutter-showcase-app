import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadLanguageEvent extends LanguageEvent {
  LoadLanguageEvent();

  @override
  List<Object?> get props => [];
}

class SetLanguageEvent extends LanguageEvent {
  Locale lang;
  SetLanguageEvent({required this.lang});

  @override
  List<Object?> get props => [lang];
}
