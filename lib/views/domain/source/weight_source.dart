import '../../data/model/weight_response.dart';
import '../entity/weight_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class WeightSourceContract {
  Future<UserCredential?> authenticateUser();
  Future<void> addWeight(WeightEntity entity);
  Stream<List<WeightResponse>>? fetchWeights();
  Future<void> updateWeight(WeightResponse entity);
  Future<void> deleteWeight(WeightResponse entity);
  Future<void> logout();
}
