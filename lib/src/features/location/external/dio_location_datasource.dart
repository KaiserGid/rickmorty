import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty/src/features/character/constants/api_constants.dart';

import '../data/datasourse/location_datasource.dart';
import '../data/models/location_model.dart';

class DioLocationDatasource implements LocationDatasource {
  Dio dio;
  int page = 1;

  DioLocationDatasource({
    required this.dio,
  });

  @override
  Future<List<LocationModel>> fetchLocations() async {
    Response response;
    List<dynamic> data;
    List<LocationModel> locationModels;

    try {
      response = await dio.get('$locationUrl?page=$page');
      data = await response.data['results'];
      locationModels = data.map((e) => LocationModel.fromMap(e)).toList();
      if (response.data['info']['pages'] < response.data['info']['count']) {
        page = page + 1;
      }

      return locationModels;
    } on DioError catch (e) {
      debugPrint(e.response.toString());
      return [];
    }
  }
}
