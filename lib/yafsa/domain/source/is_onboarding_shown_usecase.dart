import '../core/param/base/base_domain_param.dart';
import 'base/base_use_case.dart';

abstract class IsOnboardingShownUseCase
    extends BaseUseCase<bool, IsOnboardingShownUseCaseParam> {}

class IsOnboardingShownUseCaseParam extends BaseDomainParam {
  const IsOnboardingShownUseCaseParam();
}
