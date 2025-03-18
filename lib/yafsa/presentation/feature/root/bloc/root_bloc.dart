import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yafsa/yafsa/presentation/core/navigation/direction/navigation_direction.dart';
import 'package:yafsa/yafsa/presentation/feature/root/bloc/root_event.dart';
import 'package:yafsa/yafsa/presentation/feature/root/bloc/root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  late BuildContext context;

  RootBloc() : super(RootInitialState()) {
    on<LoadRootEvent>((event, emit) async {
      await _onLoadOnboardingEvent(emit);
    });
  }

  Future<void> _onLoadOnboardingEvent(Emitter<RootState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isOnboardingShown = prefs.getBool("onboarding");
    if (isOnboardingShown ?? false) {
      context.go(HomeDirection.path);
    } else {
      context.go(OnboardingDirection.path);
    }

    // themeProvider.setTheme(isDarkMode ?? false);

    // IDK why; Got blesses GetIt
    // final result = await isOnboardingShownUseCase.call();
    //
    // result.fold((error) {
    //   return emit(RootLoadedState(false));
    // }, (success) {
    //   return emit(RootLoadedState(success ?? false));
    // });
  }
}
