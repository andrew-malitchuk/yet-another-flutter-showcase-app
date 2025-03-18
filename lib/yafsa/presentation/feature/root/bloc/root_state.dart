class RootState {}

class RootInitialState extends RootState {}

class RootLoadedState extends RootState {
  final bool isOnboardingFinished;

  RootLoadedState(this.isOnboardingFinished);
}
