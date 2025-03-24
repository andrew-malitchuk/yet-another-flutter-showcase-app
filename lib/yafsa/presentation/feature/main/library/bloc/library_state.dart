import '../../../../../domain/model/book_domain_model.dart';

class LibraryState {}

class LibraryInitialState extends LibraryState {}

class LibraryLoadingState extends LibraryState {}

class LibraryLoadedState extends LibraryState {
  List<BookDomainModel> libraryList;

  LibraryLoadedState(this.libraryList);
}

class LibraryErrorState extends LibraryState {}
