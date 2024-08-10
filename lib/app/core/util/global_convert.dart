/// json을 List<모델>로 컨버팅 히는데 사용
List<T>? jsonToListLessDepth<T>(
  dynamic json,
  T Function(Map<String, dynamic> json) formJson,
) {
  List<T>? list;

  if (json is List) {
    list = json.map((e) => formJson(e)).toList();
  }
  if (list == null) return null;
  if (list.isEmpty) return null;
  return list;
}
