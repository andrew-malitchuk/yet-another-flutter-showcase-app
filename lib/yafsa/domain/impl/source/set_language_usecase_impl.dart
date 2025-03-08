import 'dart:ffi';

import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/data/repository/source/preference_repository.dart';

import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/set_language_usecase.dart';

class SetLanguageUseCaseImpl extends SetLanguageUseCase {
  final PreferenceRepository _preferenceRepository;

  SetLanguageUseCaseImpl(this._preferenceRepository);

  @override
  Future<Either<BaseDomainException, Void?>> call(
      [SetLanguageUseCaseParam? param]) async {
    try {
      if (param == null) {
        return left(DomainException());
      } else {
        _preferenceRepository.setString(key, param.language);
        return right(null);
      }
    } on Exception {
      return left(DomainException());
    }
  }

  static const String key = 'language';
}
