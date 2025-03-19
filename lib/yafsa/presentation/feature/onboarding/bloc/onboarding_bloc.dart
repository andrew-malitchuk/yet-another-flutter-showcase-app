import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:yafsa/yafsa/presentation/core/navigation/direction/navigation_direction.dart';

import '../../../../domain/source/set_onboarding_shown_usecase.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  PageController pageViewController;

  late BuildContext context;

  final setOnboardingShownUseCase =
      GetIt.instance.get<SetOnboardingShownUseCase>();

  OnboardingBloc({required this.pageViewController})
      : super(OnboardingInitialState()) {
    on<LoadOnboardingEvent>((event, emit) {
      _onLoadOnboardingEvent(emit);
    });
    on<OnboardingPageChangedEvent>((event, emit) {
      _onOnboardingPageChangedEvent(event, emit);
    });
    on<OnboardingNextPageEvent>((event, emit) {
      _onOnboardingNextPageEvent(event, emit);
    });
  }

  void _onLoadOnboardingEvent(Emitter<OnboardingState> emit) {
    emit(OnboardingLoadingState());
    emit(OnboardingLoadedState([
      "Welcome to the bookstore app! Discover a wide range of books.",
      "Easily search and find your favorite books.",
      "Enjoy a seamless reading experience with our app."
    ], 0));
  }

  void _onOnboardingPageChangedEvent(
      OnboardingPageChangedEvent event, Emitter<OnboardingState> emit) {
    final currentState = state;
    if (currentState is OnboardingLoadedState) {
      setOnboardingShownUseCase
          .call(SetOnboardingShownUseCaseParam(isOnboardingFinished: true));
      emit(OnboardingLoadedState(currentState.onboardingList, event.index));
    }
  }

  void _onOnboardingNextPageEvent(
      OnboardingNextPageEvent event, Emitter<OnboardingState> emit) {
    final currentState = state;
    if (currentState is OnboardingLoadedState) {
      if (currentState.index < currentState.onboardingList.length - 1) {
        emit(OnboardingLoadedState(
            currentState.onboardingList, currentState.index + 1));
        pageViewController.animateToPage(
          currentState.index + 1, // The index of the page to navigate to
          duration:
              Duration(milliseconds: 300), // The duration of the animation
          curve: Curves.easeInOut, // The curve of the animation
        );
      } else {
        context.go(HomeDirection.path);
      }
    }
  }
}
