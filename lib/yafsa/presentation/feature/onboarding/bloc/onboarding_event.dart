import 'package:equatable/equatable.dart';

class OnboardingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadOnboardingEvent extends OnboardingEvent {}

class OnboardingListLoadedEvent extends OnboardingEvent {
  final List<String> onboardingList;

  OnboardingListLoadedEvent(this.onboardingList);

  @override
  List<Object?> get props => [onboardingList];
}

class OnboardingPageChangedEvent extends OnboardingEvent {
  final int index;
  OnboardingPageChangedEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class OnboardingNextPageEvent extends OnboardingEvent {
  OnboardingNextPageEvent();

  @override
  List<Object?> get props => [];
}
