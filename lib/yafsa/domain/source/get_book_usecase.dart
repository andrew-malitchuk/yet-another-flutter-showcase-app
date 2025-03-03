import '../core/param/base/base_domain_param.dart';
import '../model/book_domain_model.dart';
import 'base/base_use_case.dart';

abstract class GetBookUseCase
    extends BaseUseCase<BookDomainModel?, GetBookUseCaseParam> {}

class GetBookUseCaseParam extends BaseDomainParam {
  final int id;

  const GetBookUseCaseParam({required this.id});
}
