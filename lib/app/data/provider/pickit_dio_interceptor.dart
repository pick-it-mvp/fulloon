part of 'pickit_rest_api_client.dart';

class PickitDioInterceptor extends Interceptor {
  static String? cookie;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (cookie != null) {
      options.headers['Cookie'] = cookie;
    }

    AuthService authService = Get.find<AuthService>();

    if (authService.accessToken != null) {
      options.headers['Authorization'] = 'Bearer ${authService.accessToken}';
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    var session = (response.headers['set-cookie']?.first);
    var tmpCookie = session?.split(";")[0];
    if (tmpCookie?.isNotEmpty ?? false) {
      cookie = tmpCookie;
    }
    return super.onResponse(response, handler);
  }

  /// code == 400,401,502등 오류에 대응 ; 서버에 확인 필요
  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // super.onError(err, handler);
    if (err.response?.statusCode == 502 || err.message?.contains("502") == true) {
      //TODO:
      return;
    }

    final data = err.response?.data;
    if (data is Map) {
      int code = data['code'] ?? -1;
      String msg = data['message'] ?? '';
      switch (code) {
        //TODO
      }
    }
    return handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: err.response?.data ?? '',
        statusCode: err.response?.statusCode ?? -1,
      ),
    );
  }

// /// 로그인 도입시 사용
// Future<void> refreshAndRequest(
//     Response response, ErrorInterceptorHandler handler) async {
//   // 토큰 리프레시 후 dio에 적용
//   var result = await AuthManager().getNewToken();
//   //유저 정보를 못찾는, 토큰이 만료되었을 경우 404에러를 반환하기 때문에 이경우 로그인 화면으로 보내줌
//   if (result?.accessToken == null) {
//     return;
//   }
//   var dio = await RestApiClient().dio;
//   var newResponse = await dio.request(
//     response.requestOptions.path,
//     data: response.requestOptions.data,
//     queryParameters: response.requestOptions.queryParameters,
//   );
//   handler.resolve(newResponse);
// }
}
