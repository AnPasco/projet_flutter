import 'Location.dart';
import 'Categories.dart';
import 'Stats.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Venues.g.dart';

@JsonSerializable()
class Venues{
  final String id;
  final String name;
  final Location location;
  final Categories categories;
  final Stat stat;

  Venues(this.id, this.name, this.location, this.categories, this.stat);

  Venues.fromMappedJson(Map<String, dynamic> json):id = json['id'], name = json['name'], location = new Location(json['lat'], json['lng'], json['distance'], json['country'], json['adresse'], json['city'],json['state'],json['postalCode']),categories = new Categories(json['categories'][0]['id'], json['categories'][0]['name']),stat = new Stat(json['stats']['tipCount'], json['stats']['usersCount']);


}