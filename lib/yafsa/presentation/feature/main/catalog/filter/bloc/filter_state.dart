import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

abstract class FilterState {
  var copyright = false;
  var sortAsc = false;
  List<String>? lang;

  FilterState copyWith({bool? copyright, bool? sortAsc, List<String>? lang});
}

class FilterInitialState extends FilterState {
  @override
  FilterInitialState copyWith(
      {bool? copyright, bool? sortAsc, List<String>? lang}) {
    return FilterInitialState()
      ..copyright = copyright ?? this.copyright
      ..sortAsc = sortAsc ?? this.sortAsc
      ..lang = lang ?? this.lang;
  }
}

class FilterLoadingState extends FilterState {
  @override
  FilterLoadingState copyWith(
      {bool? copyright, bool? sortAsc, List<String>? lang}) {
    return FilterLoadingState()
      ..copyright = copyright ?? this.copyright
      ..sortAsc = sortAsc ?? this.sortAsc
      ..lang = lang ?? this.lang;
  }
}

class FilterErrorState extends FilterState {
  @override
  FilterErrorState copyWith(
      {bool? copyright, bool? sortAsc, List<String>? lang}) {
    return FilterErrorState()
      ..copyright = copyright ?? this.copyright
      ..sortAsc = sortAsc ?? this.sortAsc
      ..lang = lang ?? this.lang;
  }
}

class FilterEmptyState extends FilterState {
  @override
  FilterEmptyState copyWith(
      {bool? copyright, bool? sortAsc, List<String>? lang}) {
    return FilterEmptyState()
      ..copyright = copyright ?? this.copyright
      ..sortAsc = sortAsc ?? this.sortAsc
      ..lang = lang ?? this.lang;
  }
}

class FilterLoadedState extends FilterState {
  final List<BookDomainModel> result;

  FilterLoadedState(this.result);

  @override
  FilterLoadedState copyWith(
      {bool? copyright, bool? sortAsc, List<String>? lang}) {
    return FilterLoadedState(result)
      ..copyright = copyright ?? this.copyright
      ..sortAsc = sortAsc ?? this.sortAsc
      ..lang = lang ?? this.lang;
  }
}
