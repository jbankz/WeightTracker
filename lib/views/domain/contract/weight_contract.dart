import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../data/model/weight_response.dart';
import '../entity/weight_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class WeightContract {
  Future<Either<Failure, UserCredential?>> authenticateUser();
  Future<Either<Failure, void>> addWeight(WeightEntity entity);
  Stream<List<WeightResponse>>? fetchWeights();
  Future<Either<Failure, void>> updateWeight(WeightEntity entity);
  Future<Either<Failure, void>> deleteWeight(WeightEntity entity);
  Future<Either<Failure, void>> logout();
}
