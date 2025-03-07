import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/domain/model/books_domain_model.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/search_books_usecase.dart';

class SearchBooksUseCaseImpl extends SearchBooksUseCase {
  final BookRepository _bookRepository;

  SearchBooksUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, BooksDomainModel?>> call(
      [SearchBooksUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        final result = await _bookRepository.searchBooks(param.query);
        return right(result?.toDomainModel());
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
