import 'package:equatable/equatable.dart';

class CatalogEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCatalogEvent extends CatalogEvent {}

class LoadMoreCatalogEvent extends CatalogEvent {}
