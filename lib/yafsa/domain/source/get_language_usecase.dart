import 'dart:ui';

import '../core/param/base/base_domain_param.dart';
import 'base/base_use_case.dart';

abstract class GetLanguageUseCase
    extends BaseUseCase<Locale?, GetLanguageUseCaseParam> {}

class GetLanguageUseCaseParam extends BaseDomainParam {
  const GetLanguageUseCaseParam();
}
