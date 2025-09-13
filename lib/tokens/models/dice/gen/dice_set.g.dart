// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dice_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiceSet _$DiceSetFromJson(Map<String, dynamic> json) => _DiceSet(
  label: json['label'] as String,
  dice: (json['dice'] as List<dynamic>)
      .map((e) => Die.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DiceSetToJson(_DiceSet instance) => <String, dynamic>{
  'label': instance.label,
  'dice': instance.dice,
};
