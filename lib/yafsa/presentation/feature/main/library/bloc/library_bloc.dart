import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/source/watch_books_usecase.dart';
import 'library_event.dart';
import 'library_state.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState> {
  final watchBookPageUseCase = GetIt.instance<WatchBookPageUseCase>();

  LibraryBloc() : super(LibraryInitialState()) {
    on<LoadLibraryEvent>((event, emit) async {
      emit(LibraryLoadingState());
      final result = watchBookPageUseCase.call();
      result.fold((onError) {
        emit(LibraryErrorState());
      }, (onSuccess) {
        if (onSuccess?.isEmpty == true || onSuccess == null) {
          emit(LibraryErrorState());
          return;
        }
        emit(LibraryLoadedState(onSuccess));
      });
    });
  }
}
