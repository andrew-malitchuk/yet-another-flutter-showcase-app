class OnboardingState {}

class OnboardingInitialState extends OnboardingState {}

class OnboardingLoadingState extends OnboardingState {}

class OnboardingLoadedState extends OnboardingState {
  final List<String> onboardingList;
  final int index;

  OnboardingLoadedState(this.onboardingList, this.index);
}

class OnboardingErrorState extends OnboardingState {}

class OnboardingFinishState extends OnboardingState {}
