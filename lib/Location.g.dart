// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
      (json['lat'] as num)?.toDouble(),
      (json['lng'] as num)?.toDouble(),
      json['distance'] as int,
      json['country'] as String,
      json['address'] as String,
      json['city'] as String,
      json['state'] as String,
      json['postalCode'] as int);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'distance': instance.distance
    };
