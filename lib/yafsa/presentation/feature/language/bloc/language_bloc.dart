import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/domain/source/get_language_usecase.dart';

import '../../../../domain/source/set_language_usecase.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final getLanguageUseCase = GetIt.instance.get<GetLanguageUseCase>();
  final setLanguageUseCase = GetIt.instance.get<SetLanguageUseCase>();

  LanguageBloc() : super(LanguageInitialState()) {
    on<LoadLanguageEvent>((event, emit) async {
      await _onLoadLanguageEvent(event, emit);
    });
    on<SetLanguageEvent>((event, emit) async {
      await _onSetLanguageEvent(event, emit);
    });
  }

  Future<void> _onLoadLanguageEvent(
      LoadLanguageEvent event, Emitter<LanguageState> emit) async {
    final result = await getLanguageUseCase.call();

    result.fold((error) {
      return emit(LanguageErrorState());
    }, (success) {
      if (success == null) {
        return emit(LanguageErrorState());
      } else {
        return emit(LanguageLoadedState(success));
      }
    });
  }

  Future<void> _onSetLanguageEvent(
      SetLanguageEvent event, Emitter<LanguageState> emit) async {
    final result = await setLanguageUseCase
        .call(SetLanguageUseCaseParam(language: event.lang.languageCode));

    result.fold((error) {
      return emit(LanguageErrorState());
    }, (success) {
      return emit(LanguageLoadedState(event.lang));
    });
  }
}
