import 'package:fpdart/fpdart.dart';

import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import '../../../data/repository/source/book_repository.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../model/books_domain_model.dart';
import '../../source/get_recommendation_usecase.dart';

class GetRecommendationUseCaseImpl extends GetRecommendationUseCase {
  final BookRepository _bookRepository;

  GetRecommendationUseCaseImpl(this._bookRepository);

  @override
  Future<Either<BaseDomainException, BooksDomainModel?>> call(
      [GetRecommendationUseCaseParam param =
          const GetRecommendationUseCaseParam()]) async {
    try {
      final result = await _bookRepository.getRecommendationBooks(param.limit);
      return right(result?.toDomainModel());
    } on Exception {
      return left(DomainException());
    }
  }
}
