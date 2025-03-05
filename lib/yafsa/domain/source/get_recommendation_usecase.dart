import 'package:yafsa/yafsa/domain/core/param/base/base_domain_param.dart';
import 'package:yafsa/yafsa/domain/model/books_domain_model.dart';

import 'base/base_use_case.dart';

abstract class GetRecommendationUseCase
    extends BaseUseCase<BooksDomainModel?, GetRecommendationUseCaseParam> {}

class GetRecommendationUseCaseParam extends BaseDomainParam {
  final int limit;

  const GetRecommendationUseCaseParam({this.limit = 5});
}
