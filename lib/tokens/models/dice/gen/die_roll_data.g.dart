// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../die_roll_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DieRollData _$DieRollDataFromJson(Map<String, dynamic> json) => DieRollData(
  die: Die.fromJson(json['die'] as Map<String, dynamic>),
  rolls: (json['rolls'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$DieRollDataToJson(DieRollData instance) =>
    <String, dynamic>{
      'die': instance.die,
      'rolls': instance.rolls,
      'date': instance.date.toIso8601String(),
    };
