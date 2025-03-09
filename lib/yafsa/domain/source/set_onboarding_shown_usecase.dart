import 'dart:ffi';

import '../core/param/base/base_domain_param.dart';
import 'base/base_use_case.dart';

abstract class SetOnboardingShownUseCase
    extends BaseUseCase<Void, SetOnboardingShownUseCaseParam> {}

class SetOnboardingShownUseCaseParam extends BaseDomainParam {
  final bool isOnboardingFinished;

  const SetOnboardingShownUseCaseParam({required this.isOnboardingFinished});
}
