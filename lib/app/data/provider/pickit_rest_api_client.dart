import 'dart:io';

import 'package:dio/dio.dart';
import '../environment.dart';

part 'pickit_dio_interceptor.dart';

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
    )..interceptors.add(
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
}
