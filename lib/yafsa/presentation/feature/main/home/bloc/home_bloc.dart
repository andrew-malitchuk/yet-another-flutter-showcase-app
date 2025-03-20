import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/domain/source/get_recent_book_usecase.dart';
import 'package:yafsa/yafsa/domain/source/get_recommendation_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final getBooksUseCase = GetIt.instance<GetRecommendationUseCase>();
  final getRecentBookUseCase = GetIt.instance<GetRecentBookUseCase>();

  HomeBloc() : super(HomeInitialState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());

      final recommendationResult = await getBooksUseCase.call();
      final recentResult = await getRecentBookUseCase.call();
      recommendationResult.fold(
        (error) {
          emit(HomeErrorState());
        },
        (books) {
          if (state is HomeLoadedState) {
            final currentState = state as HomeLoadedState;
            emit(currentState.copyWith(recommendationList: books?.results));
          } else {
            emit(HomeLoadedState(books?.results, null));
          }
        },
      );
      recentResult.fold((error) {
        emit(HomeErrorState());
      }, (books) {
        if (state is HomeLoadedState) {
          final currentState = state as HomeLoadedState;
          emit(currentState.copyWith(recentList: books));
        } else {
          emit(HomeLoadedState(null, books));
        }
      });
    });
  }
}
