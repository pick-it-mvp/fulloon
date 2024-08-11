import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Environment? _instance;

  /// Singleton 패턴으로 Environment 생성
  factory Environment() => _instance ??= const Environment._internal();

  const Environment._internal();

  /// BuildType에 따른 API baseUrl 지정
  /// * 24.06.09 변경 [API_BASE_URL_PRODUCTION_NO_VERSION]와 연결
  static String get apiBaseUrl {
    assert(dotenv.env['API_BASE_URL'] != null);

    return "${dotenv.env['API_BASE_URL']!}";
  }


  static String get imageBaseUrl {
    assert(dotenv.env['IMAGE_BASE_URL'] != null);
    return "${dotenv.env['IMAGE_BASE_URL']!}";
  }
}
