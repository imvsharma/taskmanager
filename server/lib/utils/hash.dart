import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class Hash {
  static Utf8Encoder encoder = const Utf8Encoder();
  static List<int> _convert(String x) => encoder.convert(x);
  static String create (String str) => sha256.convert(_convert(str)).toString();
}