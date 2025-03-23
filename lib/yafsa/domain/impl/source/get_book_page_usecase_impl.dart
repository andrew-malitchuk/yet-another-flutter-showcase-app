import 'package:fpdart/src/either.dart';

import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/get_book_page_usecase.dart';

class GetBookPageUseCaseImpl extends GetBookPageUseCase {
  final BookRepository _bookRepository;

  GetBookPageUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, List<BookDomainModel>?>> call(
      [GetBookPageUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        final result = await _bookRepository.getBooks(param.page);
        return right(result?.results.map((it) => it.toDomainModel()).toList());
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
