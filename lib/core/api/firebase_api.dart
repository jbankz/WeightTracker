import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker/core/enums/collection_type.dart';
import 'package:weight_tracker/core/helper/configs/instances.dart';
import 'package:weight_tracker/views/domain/entity/weight_entity.dart';

import '../../views/data/model/weight_response.dart';

class FirebaseService {
  FirebaseFirestore? _firestore;
  FirebaseAuth? _auth;

  /// Initialize all firebase core components
  FirebaseService(FirebaseFirestore? f, FirebaseAuth? auth) {
    _firestore = f;
    _auth = auth;
  }

  /// Authenticate User
  Future<UserCredential?> authenticateUser() async {
    try {
      return await _auth?.signInAnonymously();
    } catch (e) {
      logger.d(e);
      rethrow;
    }
  }

  /// Add weight
  Future<void> addWeight(WeightEntity entity) async {
    try {
      final _user = _auth?.currentUser;
      return await _firestore
          ?.collection(firebaseCollectionType(CollectionType.user))
          .doc(_user?.uid)
          .collection('weights')
          .doc()
          .set(entity.toMap());
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  /// Read weights
  Stream<List<WeightResponse>>? fetchWeights() {
    final _user = _auth?.currentUser;
    return _firestore
        ?.collection(firebaseCollectionType(CollectionType.user))
        .doc(_user?.uid)
        .collection('weights')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => WeightResponse.fromMap(doc.id, doc.data()))
            .toList());
  }

  /// Update weight
  Future<void> updateWeight(WeightEntity entity) async {
    try {
      final _user = _auth?.currentUser;
      return await _firestore
          ?.collection(firebaseCollectionType(CollectionType.user))
          .doc(_user?.uid)
          .collection('weights')
          .doc(entity.docId)
          .update(entity.toMap());
    } catch (e) {
      rethrow;
    }
  }

  /// Delete weight
  Future<void> deleteWeight(WeightEntity entity) async {
    try {
      final _user = _auth?.currentUser;
      return await _firestore
          ?.collection(firebaseCollectionType(CollectionType.user))
          .doc(_user?.uid)
          .collection('weights')
          .doc(entity.docId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  /// Authenticate User
  Future<void> logUserOut() async {
    try {
      return await _auth?.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
