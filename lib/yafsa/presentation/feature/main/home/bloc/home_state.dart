import '../../../../../domain/model/book_domain_model.dart';

class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  List<BookDomainModel>? recommendationList;
  List<BookDomainModel>? recentList;

  HomeLoadedState(this.recommendationList, this.recentList);

  HomeLoadedState copyWith({
    List<BookDomainModel>? recommendationList,
    List<BookDomainModel>? recentList,
  }) {
    return HomeLoadedState(
      recommendationList ?? this.recommendationList,
      recentList ?? this.recentList,
    );
  }
}

class HomeErrorState extends HomeState {}
