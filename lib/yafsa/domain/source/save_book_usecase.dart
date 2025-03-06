import 'dart:ffi';

import 'package:yafsa/yafsa/domain/model/book_domain_model.dart';

import '../core/param/base/base_domain_param.dart';
import 'base/base_use_case.dart';

abstract class SaveBookUseCase
    extends BaseUseCase<Void, SaveBookUseCaseParam> {}

class SaveBookUseCaseParam extends BaseDomainParam {
  final BookDomainModel book;

  const SaveBookUseCaseParam({required this.book});
}
