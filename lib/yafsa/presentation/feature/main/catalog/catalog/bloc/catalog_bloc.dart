import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';
import 'package:yafsa/yafsa/domain/source/get_book_page_usecase.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/catalog/bloc/catalog_event.dart';
import 'package:yafsa/yafsa/presentation/feature/main/catalog/catalog/bloc/catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final getBookPageUseCase = GetIt.instance<GetBookPageUseCase>();

  List<BookDomainModel> myList = [];
  int initLoadPage = 1;
  int currentPage = 1;

  @override
  CatalogState get initialState => CatalogInitialState();

  CatalogBloc() : super(CatalogInitialState()) {
    on<LoadCatalogEvent>((event, emit) async {
      emit(CatalogLoadingState());

      final result = await getBookPageUseCase
          .call(GetBookPageUseCaseParam(page: initLoadPage));

      result.fold((error) {
        emit(CatalogErrorState());
      }, (result) {
        myList = result ?? [];
        if (myList.isEmpty) {
          emit(CatalogEmptyState());
          return;
        }
        emit(CatalogLoadedState(myList));
      });
    });
    on<LoadMoreCatalogEvent>((event, emit) async {
      currentPage++;

      final result = await getBookPageUseCase
          .call(GetBookPageUseCaseParam(page: currentPage));

      result.fold((error) {
        emit(CatalogErrorState());
      }, (result) {
        myList += result ?? [];
        emit(CatalogLoadedState(myList));
      });
    });
  }
}
