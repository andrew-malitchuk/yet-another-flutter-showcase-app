import 'package:fpdart/fpdart.dart';

import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../model/book_domain_model.dart';
import '../../source/get_book_usecase.dart';

class GetBookUseCaseImpl extends GetBookUseCase {
  final BookRepository _bookRepository;

  GetBookUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, BookDomainModel?>> call(
      [GetBookUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        final result = await _bookRepository.getBook(param.id);

        bool isInLibrary = false;
        if (result?.results.firstOrNull != null) {
          isInLibrary = _bookRepository.isInLibrary(result!.results.first);
        }
        BookDomainModel? temp = result?.results.firstOrNull?.toDomainModel();
        temp?.isFavorite = isInLibrary;
        return right(temp);
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
