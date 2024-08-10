part of 'pickit_rest_api_client.dart';

class PickItLogInterceptor {
  LogInterceptor get logInterceptor => LogInterceptor(
        request: !kReleaseMode,
        requestHeader: !kReleaseMode,
        requestBody: !kReleaseMode,
        responseHeader: !kReleaseMode,
        responseBody: !kReleaseMode,
        error: !kReleaseMode,
        logPrint: (msg) => Log.d(msg.toString()),
      );
}
