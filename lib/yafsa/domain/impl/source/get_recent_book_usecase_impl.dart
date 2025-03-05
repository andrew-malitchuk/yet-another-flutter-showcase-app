import 'package:fpdart/src/either.dart';

import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/get_recent_book_usecase.dart';

class GetRecentBookUseCaseImpl extends GetRecentBookUseCase {
  final BookRepository _bookRepository;

  GetRecentBookUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, List<BookDomainModel>>> call(
      [GetRecentBookUseCaseParam param =
          const GetRecentBookUseCaseParam()]) async {
    try {
      final result = await _bookRepository.getLastSeenBooks(param.limit);
      return right(result.map((it) => it.toDomainModel()).toList());
    } on Exception {
      return left(DomainException());
    }
  }
}
