import 'package:flutter/material.dart';
import 'package:weight_tracker/views/domain/entity/weight_entity.dart';

import '../../../core/enums/viewstate.dart';
import '../../../core/helper/configs/instances.dart';
import '../../../core/viewmodels/base_model.dart';
import '../../data/model/weight_response.dart';
import '../../domain/usecase/weight_usecase.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WeightProvider extends BaseModel {
  final WeightUseCase _useCase;

  WeightProvider(this._useCase);

  WeightResponse? _weightResponse;
  WeightResponse? get weightResponse => _weightResponse;

  /// Authenticate user
  void authenticateUser() async {
    try {
      final _response = await _useCase.authenticateUser();
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (_) => _showToast('Authenticated Successful'));
    } catch (e) {}
  }

  /// Adds a weight
  void addWeight(WeightEntity entity) async {
    try {
      final _response = await _useCase.create(Params(entity: entity));
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (_) => _showToast('Added Weight Successfully'));
    } catch (e) {}
  }

  /// Updates a weight
  void updateWeight(WeightEntity entity) async {
    try {
      final _response = await _useCase.update(Params(entity: entity));
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (_) => _showToast('Updated Weight Successfully'));
    } catch (e) {}
  }

  /// Deletes a weight
  void deletesWeight(WeightEntity entity) async {
    try {
      final _response = await _useCase.delete(Params(entity: entity));
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (_) => _showToast('Deleted Weight Successfully'));
    } catch (e) {}
  }

  /// Returns list of weights
  Stream<List<WeightResponse>>? readWeights() {
    return _useCase.read();
  }

  /// Log user out
  void logUserOut() async {
    try {
      final _response = await _useCase.logUserOut();
      _response.fold((l) => logger.e(l.errorMessage(l.toString())),
          (_) => logger.d('Logged out Successfully'));
    } catch (e) {}
  }

  /// Set data
  void setData(WeightResponse response) {
    _weightResponse = response;
    notifyListeners();
  }

  /// Dispose
  void disposeValue() {
    _weightResponse = null;
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
