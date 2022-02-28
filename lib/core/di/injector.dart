import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:weight_tracker/core/api/firebase_api.dart';
import 'package:weight_tracker/views/data/contractImpl/weightimpl.dart';
import 'package:weight_tracker/views/domain/usecase/weight_usecase.dart';

import '../../views/data/sourceImpl/weight_source_impl.dart';

final inject = GetIt.instance;
final firebase = FirebaseFirestore.instance;
final firebaseAuth = FirebaseAuth.instance;

Future<void> initializeCore() async {
  await _initializeCore();
  _initServices();
  _initDataSources();
  _initDataContracts();
  _initializeUsecase();
}

/// Initialize the core functions here
Future<void> _initializeCore() async {
  inject.registerLazySingleton<FirebaseFirestore>(() => firebase);
  inject.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
}

/// Initialize data sources implementations
void _initDataSources() {
  inject.registerLazySingleton<WeightSourceContractImpl>(
      () => WeightSourceContractImpl(service: inject()));
}

/// Initialize data repositories implementations
void _initDataContracts() {
  inject.registerLazySingleton<WeightContractImpl>(
      () => WeightContractImpl(inject()));
}

/// Initialize services's here
void _initServices() {
  inject.registerLazySingleton<FirebaseService>(
      () => FirebaseService(inject(), inject()));
}

/// Initialize usecases here
void _initializeUsecase() {
  inject.registerLazySingleton<WeightUseCase>(() => WeightUseCase(inject()));
}
