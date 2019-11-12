// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Venues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venues _$VenuesFromJson(Map<String, dynamic> json) {
  return Venues(
      json['id'] as String,
      json['name'] as String,
      json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      json['categories'] == null
          ? null
          : Categories.fromJson(json['categories'] as Map<String, dynamic>),
      json['stat'] == null
          ? null
          : Stat.fromJson(json['stat'] as Map<String, dynamic>));
}

Map<String, dynamic> _$VenuesToJson(Venues instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'categories': instance.categories,
      'stat': instance.stat
    };
