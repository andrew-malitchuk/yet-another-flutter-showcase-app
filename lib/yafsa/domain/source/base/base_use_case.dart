import 'package:fpdart/fpdart.dart';
import 'package:yafsa/yafsa/domain/core/param/base/base_domain_param.dart';

import '../../core/exception/base/base_domain_exception.dart';

abstract class BaseUseCase<Type, Param extends BaseDomainParam> {
  Future<Either<BaseDomainException, Type?>> call([Param param]);
}

abstract class BaseStreamUseCase<Type, Param extends BaseDomainParam> {
  Either<BaseDomainException, Type?> call([Param param]);
}
