import 'dart:ffi';

import '../core/param/base/base_domain_param.dart';
import 'base/base_use_case.dart';

abstract class SetLanguageUseCase
    extends BaseUseCase<Void, SetLanguageUseCaseParam> {}

class SetLanguageUseCaseParam extends BaseDomainParam {
  final String language;

  const SetLanguageUseCaseParam({required this.language});
}
