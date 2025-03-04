import '../core/param/base/base_domain_param.dart';
import '../model/book_domain_model.dart';
import 'base/base_use_case.dart';

abstract class GetRecentBookUseCase
    extends BaseUseCase<List<BookDomainModel>, GetRecentBookUseCaseParam> {}

class GetRecentBookUseCaseParam extends BaseDomainParam {
  final int limit;

  const GetRecentBookUseCaseParam({this.limit = 5});
}
