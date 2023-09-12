import 'dart:convert';

class CharacterModel {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  String origin;
  String location;
  String image;
  List<String> episode;
  String url;
  String created;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'status': status});
    result.addAll({'species': species});
    result.addAll({'type': type});
    result.addAll({'gender': gender});
    result.addAll({'origin': origin});
    result.addAll({'location': location});
    result.addAll({'image': image});
    result.addAll({'episode': episode});
    result.addAll({'url': url});
    result.addAll({'created': created});

    return result;
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      origin: map['origin']['name'] ?? '',
      location: map['location']['name'] ?? '',
      image: map['image'] ?? '',
      episode: List<String>.from(map['episode']),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
    );
  }

  factory CharacterModel.fromJson(String source) => CharacterModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
