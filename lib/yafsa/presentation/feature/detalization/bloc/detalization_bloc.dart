import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/domain/source/save_book_usecase.dart';

import '../../../../domain/source/add_to_library_usecase.dart';
import '../../../../domain/source/get_book_usecase.dart';
import 'detalization_event.dart';
import 'detalization_state.dart';

class DetalizationBloc extends Bloc<DetalizationEvent, DetalizationState> {
  final getBookUseCase = GetIt.instance.get<GetBookUseCase>();
  final saveBookUseCase = GetIt.instance.get<SaveBookUseCase>();
  final addToLibraryUseCase = GetIt.instance.get<AddToLibraryUseCase>();

  DetalizationBloc() : super(DetalizationInitialState()) {
    on<LoadDetailsEvent>((event, emit) async {
      await _onLoadDetalizationEvent(event, emit);
    });
    on<ToggleDetailsEvent>((event, emit) async {
      final temp = event.bookDomainModel;
      temp.isFavorite = !temp.isFavorite;

      addToLibraryUseCase(AddToLibraryUseCaseParam(book: temp));
      add(LoadDetailsEvent(temp.id));
    });
  }

  Future<void> _onLoadDetalizationEvent(
      LoadDetailsEvent event, Emitter<DetalizationState> emit) async {
    final result =
        await getBookUseCase.call(GetBookUseCaseParam(id: (event.id)));

    result.fold((error) {
      return emit(DetalizationErrorState());
    }, (success) {
      if (success == null) {
        return emit(DetalizationErrorState());
      } else {
        saveBookUseCase.call(SaveBookUseCaseParam(book: success));
        return emit(DetalizationLoadedState(success));
      }
    });
  }
}
