import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/character/constants/api_constants.dart';
import 'package:rickmorty/src/features/character/data/datasources/character_datasource.dart';
import 'package:rickmorty/src/features/character/data/models/character_model.dart';

class DioharacterDatasource implements CharacterDatasource {
  Dio dio;
  int page = 1;

  DioharacterDatasource({
    required this.dio,
  });

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    Response response;
    List<dynamic> data;
    List<CharacterModel> characterModels;

    try {
      response = await dio.get('$characterUrl?page=$page');
      data = await response.data['results'];
      characterModels = data.map((e) => CharacterModel.fromMap(e)).toList();
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
