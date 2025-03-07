import '../core/param/base/base_domain_param.dart';
import '../model/books_domain_model.dart';
import 'base/base_use_case.dart';

abstract class SearchBooksUseCase
    extends BaseUseCase<BooksDomainModel?, SearchBooksUseCaseParam> {}

class SearchBooksUseCaseParam extends BaseDomainParam {
  final String query;

  const SearchBooksUseCaseParam({required this.query});
}
