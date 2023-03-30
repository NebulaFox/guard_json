
import 'array.dart';
import 'exceptions.dart';
import 'object.dart';

class GuardJson {
  final String keyPath;
  final Object json;

  const GuardJson(this.json, {
    this.keyPath = "root"
  });

  GuardJsonObject isJsonObject() {
    if (json is! Map<String, dynamic>) {
      throw GuardJsonException(message: "$keyPath is not an object", json: json);
    } else {
      return GuardJsonObject(json as Map<String, dynamic>, keyPath: keyPath);
    }
  }

  GuardJsonArray isJsonArray() {
    if (json is! List<dynamic>) {
      throw GuardJsonException(message: "$keyPath is not an array", json: json);
    } else {
      return GuardJsonArray(json as List<dynamic>, keyPath: keyPath);
    }
  }
}