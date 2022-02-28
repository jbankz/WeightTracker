import 'package:weight_tracker/core/helper/configs/instances.dart';

import '../../domain/entity/weight_entity.dart';

class WeightResponse extends WeightEntity {
  final String? docId;
  final WeightEntity? entity;

  const WeightResponse({this.docId, this.entity});

  factory WeightResponse.fromMap(String docId, Map<String, dynamic> map) {
    return WeightResponse(
      docId: docId,
      entity: WeightEntity.fromMap(map),
    );
  }

  @override
  String toString() => 'WeightResponse(docId: $docId, entity: $entity)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeightResponse &&
        other.docId == docId &&
        other.entity == entity;
  }

  @override
  int get hashCode => docId.hashCode ^ entity.hashCode;
}
