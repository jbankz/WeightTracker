import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/contractImpl/weightimpl.dart';
import '../../data/model/weight_response.dart';
import '../entity/weight_entity.dart';

class WeightUseCase implements UseCase<void, Params> {
  final WeightContractImpl repository;

  WeightUseCase(this.repository);

  @override
  Future<Either<Failure, void>> authenticateUser() async {
    return await repository.authenticateUser();
  }

  @override
  Future<Either<Failure, void>> create(Params params) async {
    return await repository.addWeight(params.entity!);
  }

  @override
  Future<Either<Failure, void>> delete(Params params) async {
    return await repository.deleteWeight(params.entity!);
  }

  @override
  Stream<List<WeightResponse>>? read() {
    return repository.fetchWeights();
  }

  @override
  Future<Either<Failure, void>> update(Params params) async {
    return await repository.updateWeight(params.entity!);
  }

  @override
  Future<Either<Failure, void>> logUserOut() async {
    return await repository.logout();
  }
}

class Params extends Equatable {
  final WeightEntity? entity;

  const Params({@required this.entity});

  @override
  List<Object> get props => [entity!];
}
