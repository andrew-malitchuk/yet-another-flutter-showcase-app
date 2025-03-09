import 'dart:ffi';

import 'package:fpdart/fpdart.dart';

import '../../../data/repository/source/preference_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/set_onboarding_shown_usecase.dart';

class SetOnboardingShownUseCaseImpl extends SetOnboardingShownUseCase {
  final PreferenceRepository _preferenceRepository;

  SetOnboardingShownUseCaseImpl(this._preferenceRepository);

  @override
  Future<Either<BaseDomainException, Void?>> call(
      [SetOnboardingShownUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        _preferenceRepository.setBool(key, param.isOnboardingFinished);
        return right(null);
      }
    } on Exception {
      return left(DomainException());
    }
  }

  static const String key = 'onboarding';
}
