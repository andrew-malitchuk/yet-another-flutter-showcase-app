import 'dart:ffi';

import '../core/param/base/base_domain_param.dart';
import '../model/book_domain_model.dart';
import 'base/base_use_case.dart';

abstract class AddToLibraryUseCase
    extends BaseUseCase<Void, AddToLibraryUseCaseParam> {}

class AddToLibraryUseCaseParam extends BaseDomainParam {
  final BookDomainModel book;

  const AddToLibraryUseCaseParam({required this.book});
}
