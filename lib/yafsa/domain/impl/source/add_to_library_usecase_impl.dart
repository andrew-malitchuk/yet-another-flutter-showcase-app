import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/add_to_library_usecase.dart';

class AddToLibraryUseCaseImpl extends AddToLibraryUseCase {
  final BookRepository _bookRepository;

  AddToLibraryUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, Void?>> call(
      [AddToLibraryUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        if (param.book.isFavorite) {
          _bookRepository.addToLibrary(param.book.toRepositoryModel());
        } else {
          _bookRepository.removeFromLibrary(param.book.toRepositoryModel());
        }
        return right(null);
      }
    } on Exception {
      return left(DomainException());
    }
  }
}
