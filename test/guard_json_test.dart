import 'package:guard_json/guard_json.dart';
import 'package:test/test.dart';

void main() {
  test("object example", () {
    final json = {"key": "value"};
    expect(() {
      guardJson(json).isJsonObject().withConditions((declare) {
        declare.forKey("key")
          ..doesExist()
          ..isNotNull()
          ..hasType(String);
      });
    }, returnsNormally);
  });

  test("2 level object example", () {
    final json = {
      "object": {
        "key": "value"
      }
    };

    expect(() {
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
    }, returnsNormally);
  });

  test("array", () {
    final json = <dynamic> [];

    expect(() {
      guardJson(json).isJsonArray();
    }, returnsNormally);
  });
}
