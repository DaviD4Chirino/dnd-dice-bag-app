// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dice_bag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiceBag _$DiceBagFromJson(Map<String, dynamic> json) => _DiceBag(
  label: json['label'] as String,
  dice: (json['dice'] as List<dynamic>)
      .map((e) => Die.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DiceBagToJson(_DiceBag instance) => <String, dynamic>{
  'label': instance.label,
  'dice': instance.dice,
};
