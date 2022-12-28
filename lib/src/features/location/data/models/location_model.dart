import 'dart:convert';

class LocationModel {
  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  String created;

  LocationModel({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'type': type});
    result.addAll({'dimension': dimension});
    result.addAll({'residents': residents});
    result.addAll({'url': url});
    result.addAll({'created': created});

    return result;
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      dimension: map['dimension'] ?? '',
      residents: List<String>.from(map['residents']),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationModel.fromJson(String source) => LocationModel.fromMap(json.decode(source));
}
