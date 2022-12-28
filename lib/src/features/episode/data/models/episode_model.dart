import 'dart:convert';

class EpisodeModel {
  int id;
  String name;
  String air_date;
  String episode;
  List<String> characters;
  String url;
  String created;

  EpisodeModel({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'air_date': air_date});
    result.addAll({'episode': episode});
    result.addAll({'characters': characters});
    result.addAll({'url': url});
    result.addAll({'created': created});

    return result;
  }

  factory EpisodeModel.fromMap(Map<String, dynamic> map) {
    return EpisodeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      air_date: map['air_date'] ?? '',
      episode: map['episode'] ?? '',
      characters: List<String>.from(map['characters']),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EpisodeModel.fromJson(String source) => EpisodeModel.fromMap(json.decode(source));
}