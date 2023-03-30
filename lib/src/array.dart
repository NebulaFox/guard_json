
class GuardJsonArray {
  final String keyPath;
  final List<dynamic> json;

  const GuardJsonArray(this.json, {
    this.keyPath = "root"
  });
}