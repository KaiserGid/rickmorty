import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/character/constants/api_constants.dart';

import '../data/datasourse/location_datasource.dart';
import '../data/models/episode_model.dart';

class DioEpisodeDatasource implements EpisodeDatasource {
  Dio dio;
  int page = 1;

  DioEpisodeDatasource({
    required this.dio,
  });

  @override
  Future<List<EpisodeModel>> fetchEpisodes() async {
    Response response;
    List<dynamic> data;
    List<EpisodeModel> episodeModels;

    try {
      response = await dio.get('$episodeUrl?page=$page');
      data = await response.data['results'];
      episodeModels = data.map((e) => EpisodeModel.fromMap(e)).toList();
      if (response.data['info']['pages'] < response.data['info']['count']) {
        page = page + 1;
      }

      return episodeModels;
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return [];
    }
  }
}
