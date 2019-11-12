// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) {
  return Stat(json['tipCount'] as int, json['usersCount'] as int);
}

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'tipCount': instance.tipCount,
      'usersCount': instance.usersCount
    };
