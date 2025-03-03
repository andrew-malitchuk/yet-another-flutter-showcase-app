import 'package:fpdart/fpdart.dart';

import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../model/books_domain_model.dart';
import '../../source/get_books_usecase.dart';

class GetBooksUseCaseImpl extends GetBooksUseCase {
  final BookRepository _bookRepository;

  GetBooksUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, BooksDomainModel?>> call(
      [GetBooksUseCaseParam param = const GetBooksUseCaseParam()]) async {
    try {
      final result = await _bookRepository.getBooks(1);
      return right(result?.toDomainModel());
    } on Exception {
      return left(DomainException());
    }
  }
}
