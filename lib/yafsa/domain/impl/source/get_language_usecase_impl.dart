import 'dart:ui';

import 'package:fpdart/fpdart.dart';

import '../../../data/repository/source/preference_repository.dart';
import '../../core/exception/base/base_domain_exception.dart';
import '../../core/exception/base/domain_exception.dart';
import '../../source/get_language_usecase.dart';

class GetLanguageUseCaseImpl extends GetLanguageUseCase {
  final PreferenceRepository _preferenceRepository;

  GetLanguageUseCaseImpl(this._preferenceRepository);

  @override
  Future<Either<BaseDomainException, Locale?>> call(
      [GetLanguageUseCaseParam param = const GetLanguageUseCaseParam()]) async {
    try {
      final result = await _preferenceRepository.getString(key);
      return right(_getLocale(result));
    } on Exception {
      return left(DomainException());
    }
  }

  Locale _getLocale(String? language) {
    switch (language) {
      case 'en':
        return const Locale('en', '');
      case 'uk':
        return const Locale('uk', 'UA');
      default:
        return const Locale('en', '');
    }
  }

  static const String key = 'language';
}
