import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:juction/app/core/global_logger.dart';
import 'package:juction/app/core/util/global_convert.dart';
import 'package:juction/app/data/service/auth/service.dart';
import '../environment.dart';
import '../models/food/food.dart';
import '../models/food/food_preview.dart';
import '../models/search/search.dart';

part 'pickit_dio_interceptor.dart';

part 'pick_it_log_interceptor.dart';

class RestApiClient {
  // 팩토리(싱글톤) 객체생성
  factory RestApiClient() => _instance;

  // dio 객체 생성
  late Future<Dio> _dio;

  Future<Dio> get dio => _dio;

  // 인스턴스 초기화
  static final _instance = RestApiClient.private();

  //초기화
  RestApiClient.private() {
    _dio = _initDio(Environment.apiBaseUrl);
  }

  // 가끔 옵션 수정할일 있을때 싱글톤 객제 말고 이거로 그떄그때 만들어 써야함
  Future<Dio> copyDio() async {
    return await _initDio(Environment.apiBaseUrl);
  }

  // dio 초기 셋팅
  Future<Dio> _initDio(String url) async {
    String? userToken;
    return Dio(
      BaseOptions(
        baseUrl: url,
        //1분
        connectTimeout: 60000,
        receiveTimeout: 60000,
        headers: (userToken == null)
            ? {
                'Authorization': 'Baerer $userToken',
              }
            : null,
        contentType: ContentType.json.mimeType,
      ),
    )
      ..interceptors.add(
        PickitDioInterceptor(),
      )
      ..interceptors.add(
        PickitDioInterceptor(),
      );
  }

  ///*만약 OS, Version, 기기 정보가 필요하다면 사용
  // Future<Map<String,String>> getClientInfo() async{
  //   final osType = Platform.isAndroid ? 1 : 2;
  //
  //   final deviceInfoPlugin = DeviceInfoPlugin();
  //
  //   String osVersion;
  //   String model;
  //
  //   if (Platform.isAndroid) {
  //     final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  //     osVersion = androidDeviceInfo.version.release;
  //     model = androidDeviceInfo.model;
  //   } else {
  //     final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  //     osVersion = iosDeviceInfo.systemVersion;
  //     model = iosDeviceInfo.utsname.machine;
  //   }
  //   return {
  //     'User-Agent': '@@:$appVersion;$osType ($osVersion; $model)',
  //   };
  // }

  Future<List<Map>> getSearchHistory(int id) async {
    final response = await (await dio).get('/users/$id/search');

    Log.d(response.data.toString());

    return jsonToListLessDepth(response.data, (json) => json as Map) ?? [];
  }

  Future<void> deleteSearchHistory(int id) async {
    await (await dio).delete('/search/$id');
  }

  Future<List<Search>> getSearchKeyword(String query) async {
    final response = await (await dio).get('/search/$query');

    Log.d("getSearchKeyword: ${response.data}");

    return jsonToListLessDepth(response.data, Search.fromJson) ?? [];
  }

  Future<Food?> getSearchResult(int id, {bool search = false}) async {
    final response = await (await dio).get('/foods/$id', queryParameters: search ? {'search': true} : null);

    Log.d("getSearchResult: ${response.data}");

    if (response.statusCode != 200) return null;
    return Food.fromJson(response.data);
  }

  Future<List<FoodPreview>> getCategories(int id) async {
    final response = await (await dio).get('/foods/categories/$id');
    if (response.statusCode != 200) return [];
    return jsonToListLessDepth(response.data, FoodPreview.fromJson) ?? [];
  }

  Future<void> registerUser(Map<String, dynamic> data) async {
    final response = await (await dio).post('/auth/sign-up', data: data);
    Log.d("registerUser: ${response.data}");
  }
}
