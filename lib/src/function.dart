
import 'root.dart';
import 'object.dart';
import 'array.dart';

GuardJson guardJson(Object json, {String? name}) {
 return GuardJson(json, keyPath: name ?? "root");
}

GuardJsonObject guardJsonObject(Map<String, dynamic> json, {String? name}) {
  return GuardJson(json, keyPath: name ?? "root").isJsonObject();
}

GuardJsonArray guardJsonArray(List<dynamic> json, {String? name}) {
  return GuardJson(json, keyPath: name ?? "root").isJsonArray();
}