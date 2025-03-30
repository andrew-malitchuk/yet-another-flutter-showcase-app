import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

abstract class CatalogState {}

class CatalogInitialState extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogErrorState extends CatalogState {}

class CatalogEmptyState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final List<BookDomainModel> myList;

  CatalogLoadedState(this.myList);
}
