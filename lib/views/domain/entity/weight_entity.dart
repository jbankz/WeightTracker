import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class WeightEntity extends Equatable {
  final double? weight;
  final String? time;
  final String? docId;

  const WeightEntity({this.weight, this.time, this.docId});

  Map<String, dynamic> toMap() {
    return {'weight': weight, 'time': FieldValue.serverTimestamp()};
  }

  factory WeightEntity.fromMap(Map<String, dynamic> map) {
    String? _formatTime(map) {
      DateTime myDateTime = (map.toDate());
      return DateFormat.yMMMd().add_jm().format(myDateTime);
    }

    return WeightEntity(
        weight: map['weight']?.toDouble(),
        time: _formatTime(map['time']) ?? '');
  }

  String toJson() => json.encode(toMap());

  factory WeightEntity.fromJson(String source) =>
      WeightEntity.fromMap(json.decode(source));

  @override
  List<Object?> get props => [];
}
