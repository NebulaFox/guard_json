
import 'exceptions.dart';

class GuardJsonObject {
  final String keyPath;
  final Map<String, dynamic> json;

  const GuardJsonObject(this.json, {
    required this.keyPath
  });

  void withConditions(void Function(GuardJsonObjectConditions conditions) block) {
    final conditions = GuardJsonObjectConditions(json, keyPath: keyPath);
    block(conditions);
  }
}

class GuardJsonObjectConditions {
  final String keyPath;
  final Map<String, dynamic> json;

  const GuardJsonObjectConditions(this.json, {
    required this.keyPath
  });

  GuardJsonObjectConditionsKey forKey(String key) =>
    GuardJsonObjectConditionsKey(json, key, keyPath: keyPath);
}

class GuardJsonObjectConditionsKey {
  final String key;
  final String keyPath;
  final Map<String, dynamic> json;

  const GuardJsonObjectConditionsKey(this.json, this.key, {
    required this.keyPath,
  });

  void doesExist() {
    if (!json.containsKey(key)) {
      throw GuardJsonException(message: "$keyPath does not contain $key", json: json);
    }
  }

  void isNotNull() {
    if (json[key] == null) {
      throw GuardJsonException(message: "$key is null in $keyPath", json: json);
    }
  }

  void hasType(Type type) {
    if (json[key] != null && json[key].runtimeType != type) {
      throw GuardJsonException(message: "$key is not type $type in $keyPath", json: json);
    }
  }

  void isJsonObject() {
    if (json[key] is! Map<String, dynamic>) {
      throw GuardJsonException(message: "$key is not a json object in $keyPath", json: json);
    }
  }

  void isJsonArray() {
    if (json[key] is! List<dynamic>) {
      throw GuardJsonException(message: "$keyPath is not an array", json: json);
    }
  }
}