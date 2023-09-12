import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/src/core/constants/api_constants.dart';
import 'package:rickmorty/src/core/features/characteres/data/datasources/character_datasource.dart';
import 'package:rickmorty/src/core/features/characteres/models/character_entity.dart';

class DioharacterDatasource implements CharacterDatasource {
  Dio dio;
  int page = 1;

  DioharacterDatasource({
    required this.dio,
  });

  @override
  Future<List<Character>> fetchCharacters() async {
    Response response;
    List<dynamic> data;
    List<Character> characterModels;

    try {
      response = await dio.get('$characterUrl?page=$page');
      data = await response.data['results'];
      characterModels = data.map((e) => Character.fromJson(e)).toList();
      if (response.data['info']['pages'] < response.data['info']['count']) {
        page = page + 1;
      }

      return characterModels;
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return [];
    }
  }
}
