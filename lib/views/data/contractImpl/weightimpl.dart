import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failures.dart';
import '../../domain/contract/weight_contract.dart';
import '../../domain/entity/weight_entity.dart';
import '../model/weight_response.dart';
import '../sourceImpl/weight_source_impl.dart';

class WeightContractImpl implements WeightContract {
  final WeightSourceContractImpl _contractImpl;

  WeightContractImpl(this._contractImpl);

  @override
  Future<Either<Failure, void>> addWeight(WeightEntity entity) async {
    try {
      final _response = await _contractImpl.addWeight(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWeight(WeightEntity entity) async {
    try {
      final _response = await _contractImpl.deleteWeight(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateWeight(WeightEntity entity) async {
    try {
      final _response = await _contractImpl.updateWeight(entity);
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential?>> authenticateUser() async {
    try {
      final _response = await _contractImpl.authenticateUser();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  @override
  Stream<List<WeightResponse>>? fetchWeights() {
    return _contractImpl.fetchWeights();
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final _response = await _contractImpl.logout();
      return Right(_response);
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}
