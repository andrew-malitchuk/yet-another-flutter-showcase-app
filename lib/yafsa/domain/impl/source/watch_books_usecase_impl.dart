import 'package:fpdart/fpdart.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../model/book_domain_model.dart';
import '../../source/watch_books_usecase.dart';

class WatchBookPageUseCaseImpl extends WatchBookPageUseCase {
  final BookRepository _bookRepository;

  WatchBookPageUseCaseImpl(this._bookRepository);

  @override
  Either<BaseDomainException, List<BookDomainModel>?> call(
      [WatchBooksUseCaseParam? param]) {
    try {
      return right(
          _bookRepository.changes().map((it) => it.toDomainModel()).toList());
    } on Exception {
      return left(DomainException());
    }
  }
}
