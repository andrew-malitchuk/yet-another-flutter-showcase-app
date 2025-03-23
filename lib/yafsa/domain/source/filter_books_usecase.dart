import '../core/param/base/base_domain_param.dart';
import '../model/books_domain_model.dart';
import 'base/base_use_case.dart';

abstract class FilterBooksUseCase
    extends BaseUseCase<BooksDomainModel?, FilterBooksUseCaseParam> {}

class FilterBooksUseCaseParam extends BaseDomainParam {
  final int page;
  final bool copyright;
  final bool sortAsc;
  final List<String>? lang;

  const FilterBooksUseCaseParam(
      {required this.page,
      required this.copyright,
      required this.sortAsc,
      required this.lang});
}
