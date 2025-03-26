import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/domain/source/search_books_usecase.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/bloc/search_event.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final searchBooksUseCase = GetIt.instance<SearchBooksUseCase>();

  SearchBloc() : super(SearchInitialState()) {
    on<InitialLoadSearchEvent>((event, emit) async {
      emit(SearchLoadingState());

      final response =
          await searchBooksUseCase.call(SearchBooksUseCaseParam(query: ""));
      response.fold((error) {
        emit(SearchErrorState());
      }, (result) {
        if (result == null) {
          emit(SearchEmptyState());
        } else {
          emit(SearchLoadedState(result));
        }
      });
    });
    on<QuerySearchEvent>((event, emit) async {
      emit(SearchLoadingState());

      final response = await searchBooksUseCase.call(
        SearchBooksUseCaseParam(query: event.query),
      );
      response.fold((error) {
        emit(SearchErrorState());
      }, (result) {
        if (result == null || result.results.isEmpty) {
          emit(SearchEmptyState());
        } else {
          emit(SearchLoadedState(result));
        }
      });
    });
  }
}
