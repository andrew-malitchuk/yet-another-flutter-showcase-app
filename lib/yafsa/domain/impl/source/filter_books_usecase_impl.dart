import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/domain/model/books_domain_model.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/filter_books_usecase.dart';

class FilterBooksUseCaseImpl extends FilterBooksUseCase {
  final BookRepository _bookRepository;

  FilterBooksUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, BooksDomainModel?>> call(
      [FilterBooksUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        final result = await _bookRepository.filterBooks(
          param.page,
          param.copyright,
          param.sortAsc,
          param.lang,
        );
        return right(result?.toDomainModel());
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
