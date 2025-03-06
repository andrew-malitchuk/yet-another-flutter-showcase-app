import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../model/book_domain_model.dart';
import '../../source/save_book_usecase.dart';

class SaveBookUseCaseImpl extends SaveBookUseCase {
  final BookRepository _bookRepository;

  SaveBookUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, Void?>> call(
      [SaveBookUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        _bookRepository.addBook(param.book.toRepositoryModel());
        _bookRepository.getLastSeenBooks(5);
        return right(null);
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
