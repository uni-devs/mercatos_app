// ignore_for_file: non_constant_identifier_names

import 'endpoints.dart';

export 'endpoints.dart';

abstract class MercatosNetwork with Endpoints {
  static String get domain => 'https://kargo.unidevs.co';

  static Uri uri(String endpoint) {
    return Uri.parse(domain + endpoint);
  }

  static header() => {'Content-Type': 'application/json'};
}
