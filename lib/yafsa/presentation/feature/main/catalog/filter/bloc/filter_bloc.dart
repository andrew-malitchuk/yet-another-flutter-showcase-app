import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/bloc/filter_event.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/filter/bloc/filter_state.dart';

import '../../../../../../domain/model/book_domain_model.dart';
import '../../../../../../domain/source/filter_books_usecase.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final filterBooksUseCase = GetIt.instance<FilterBooksUseCase>();

  List<BookDomainModel> myList = [];
  int initLoadPage = 1;
  int currentPage = 1;

  FilterBloc() : super(FilterInitialState()) {
    on<InitialLoadFilterEvent>((event, emit) async {
      emit(FilterLoadingState().copyWith(
        copyright: state.copyright,
        sortAsc: state.sortAsc,
        lang: state.lang,
      ));
      add(PerformFilterEvent());
    });
    on<CopyrightFilterEvent>((event, emit) async {
      myList = [];
      currentPage = 1;
      emit(FilterLoadingState().copyWith(
        copyright: state.copyright,
        sortAsc: state.sortAsc,
        lang: state.lang,
      ));

      final currentState =
          state.copyWith(copyright: event.copyright, sortAsc: state.sortAsc);
      emit(currentState);
      add(PerformFilterEvent());
    });
    on<SortFilterEvent>((event, emit) async {
      myList = [];
      currentPage = 1;
      emit(FilterLoadingState().copyWith(
        copyright: state.copyright,
        sortAsc: state.sortAsc,
        lang: state.lang,
      ));

      final currentState = state.copyWith(
          copyright: state.copyright, sortAsc: event.sortAsc, lang: state.lang);
      emit(currentState);
      add(PerformFilterEvent());
    });
    on<LangFilterEvent>((event, emit) async {
      myList = [];
      currentPage = 1;
      emit(FilterLoadingState().copyWith(
        copyright: state.copyright,
        sortAsc: state.sortAsc,
        lang: state.lang,
      ));

      final currentState = state.copyWith(
          copyright: state.copyright, sortAsc: state.sortAsc, lang: event.lang);
      emit(currentState);
      add(PerformFilterEvent());
    });
    on<LoadMoreFilterEvent>((event, emit) async {
      currentPage++;
      add(PerformFilterEvent());
    });

    on<PerformFilterEvent>((event, emit) async {
      final response = await filterBooksUseCase.call(
        FilterBooksUseCaseParam(
          page: currentPage,
          lang: state.lang,
          sortAsc: state.sortAsc,
          copyright: state.copyright,
        ),
      );
      response.fold((error) {
        emit(FilterErrorState());
      }, (result) {
        if (result == null || result.results.isEmpty) {
          emit(FilterEmptyState());
        } else {
          myList += result.results;
          emit(FilterLoadedState(myList).copyWith(
            copyright: state.copyright,
            sortAsc: state.sortAsc,
            lang: state.lang,
          ));
        }
      });
    });
  }
}
