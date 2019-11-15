import 'package:json_annotation/json_annotation.dart';

part 'Location.g.dart';

@JsonSerializable()
class Location {
  double lat;
  double lng;
  String country;
  String city;
  String state;
  int postalCode;
  String address;
  int distance;



  Location(this.lat, this.lng, this.distance, this.country, this.address, this.city,this.state,this.postalCode);

  static fromJson(Map<String,dynamic > json) {}
}


