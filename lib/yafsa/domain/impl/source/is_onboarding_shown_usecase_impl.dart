import 'package:fpdart/src/either.dart';
import 'package:yafsa/yafsa/data/repository/source/preference_repository.dart';
import 'package:yafsa/yafsa/domain/core/exception/base/base_domain_exception.dart';

import '../../core/exception/base/domain_exception.dart';
import '../../source/is_onboarding_shown_usecase.dart';

class IsOnboardingShownUseCaseImpl extends IsOnboardingShownUseCase {
  final PreferenceRepository _preferenceRepository;

  IsOnboardingShownUseCaseImpl(this._preferenceRepository);

  @override
  Future<Either<BaseDomainException, bool?>> call(
      [IsOnboardingShownUseCaseParam param =
          const IsOnboardingShownUseCaseParam()]) async {
    try {
      final result = await _preferenceRepository.getBool(key);
      return right(result);
    } on Exception {
      return left(DomainException());
    }
  }

  static const String key = 'onboarding';
}
