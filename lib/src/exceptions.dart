
class GuardJsonException implements Exception {
  final String message;
  final Object json;

  const GuardJsonException({
    required this.message,
    required this.json,
  });

  @override
  toString() {
    final buf = StringBuffer();

    buf.writeln("GuardJsonException: $message,");
    buf.writeln("<json>");
    buf.writeln(json);
    buf.writeln("</json>");
    return buf.toString();
  }
}