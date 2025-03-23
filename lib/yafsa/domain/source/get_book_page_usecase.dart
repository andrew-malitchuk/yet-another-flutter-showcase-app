import '../core/param/base/base_domain_param.dart';
import '../model/book_domain_model.dart';
import 'base/base_use_case.dart';

abstract class GetBookPageUseCase
    extends BaseUseCase<List<BookDomainModel>, GetBookPageUseCaseParam> {}

class GetBookPageUseCaseParam extends BaseDomainParam {
  final int page;

  const GetBookPageUseCaseParam({required this.page});
}
