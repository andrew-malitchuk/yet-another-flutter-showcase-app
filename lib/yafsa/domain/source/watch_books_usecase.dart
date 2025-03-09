import '../core/param/base/base_domain_param.dart';
import '../model/book_domain_model.dart';
import 'base/base_use_case.dart';

abstract class WatchBookPageUseCase
    extends BaseStreamUseCase<List<BookDomainModel>, WatchBooksUseCaseParam> {}

class WatchBooksUseCaseParam extends BaseDomainParam {
  const WatchBooksUseCaseParam();
}
