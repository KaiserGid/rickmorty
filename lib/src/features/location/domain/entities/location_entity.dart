import 'package:flutter/foundation.dart';
import 'package:rickmorty/src/core/entity.dart';

class LocationEntity extends Entity {
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;

  LocationEntity({
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationEntity && other.name == name && other.type == type && other.dimension == dimension && listEquals(other.residents, residents) && other.url == url;
  }

  @override
  int get hashCode {
    return name.hashCode ^ type.hashCode ^ dimension.hashCode ^ residents.hashCode ^ url.hashCode;
  }
}
