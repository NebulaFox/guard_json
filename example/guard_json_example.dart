import 'package:guard_json/guard_json.dart';

void main() {
  final json = {
      "object": {
        "key": "value"
      }
    };

    guardJson(json).isJsonObject().withConditions((declare) {
      declare.forKey("object")
        ..doesExist()
        ..isNotNull()
        ..isJsonObject();
    });

    guardJson(json["object"]!).isJsonObject().withConditions((conditions) {
      conditions.forKey("key")
        ..doesExist()
        ..isNotNull()
        ..hasType(String);
    });
}
