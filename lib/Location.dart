import 'package:json_annotation/json_annotation.dart';

part 'Location.g.dart';

@JsonSerializable()
class Location {
  double lat;
  double lng;
  String country;
  String city;
  String state;
  String postalCode;
  String address;
  int distance;



  Location(this.lat, this.lng, this.distance, this.country, this.address, this.city,this.state,this.postalCode);

  static fromJson(Map<String,dynamic > json) {}

  @override
  String toString() {
    return '  ville : $city \n  code postale : $postalCode\n  departement : $state';
  }

}


