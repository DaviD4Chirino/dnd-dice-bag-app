// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../die.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Die _$DieFromJson(Map<String, dynamic> json) => Die(
  faces: (json['faces'] as num).toInt(),
  amount: (json['amount'] as num?)?.toInt() ?? 1,
  modifier: (json['modifier'] as num?)?.toInt() ?? 0,
  alt: json['alt'] as bool? ?? false,
  filled: json['filled'] as bool? ?? true,
);

Map<String, dynamic> _$DieToJson(Die instance) => <String, dynamic>{
  'faces': instance.faces,
  'amount': instance.amount,
  'modifier': instance.modifier,
  'filled': instance.filled,
  'alt': instance.alt,
};
