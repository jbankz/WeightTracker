import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/core/api/firebase_api.dart';

import '../../domain/entity/weight_entity.dart';
import '../../domain/source/weight_source.dart';
import '../model/weight_response.dart';

class WeightSourceContractImpl implements WeightSourceContract {
  final FirebaseService _service;

  WeightSourceContractImpl({required FirebaseService service})
      : _service = service;

  @override
  Future<void> addWeight(WeightEntity entity) async {
    return await _service.addWeight(entity);
  }

  @override
  Future<void> deleteWeight(WeightEntity entity) async {
    return await _service.deleteWeight(entity);
  }

  @override
  Future<void> updateWeight(WeightEntity entity) async {
    return await _service.updateWeight(entity);
  }

  @override
  Future<UserCredential?> authenticateUser() async {
    return await _service.authenticateUser();
  }

  @override
  Stream<List<WeightResponse>>? fetchWeights() {
    return _service.fetchWeights();
  }

  @override
  Future<void> logout() async {
    return await _service.logUserOut();
  }
}
