import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../views/domain/entity/weight_entity.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> authenticateUser();
  Future<Either<Failure, Type>> create(Params params);
  Stream<List<WeightEntity>>? read();
  Future<Either<Failure, Type>> update(Params params);
  Future<Either<Failure, Type>> delete(Params params);
  Future<Either<Failure, Type>> logUserOut();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
