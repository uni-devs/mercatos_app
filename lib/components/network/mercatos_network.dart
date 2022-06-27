import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

export 'endpoints.dart';
import 'network_request_interface.dart';

class MercatosNetwork {
  static const String _domain = '';

  String _lang = "en";

  setLanguage(String lang) {
    _lang = lang;
  }
  // singleton instance .. it just create one instance of the class
  // for whole application and it is shared by all the classes
  // to save the memory and time

  MercatosNetwork._();

  static final MercatosNetwork _singleton = MercatosNetwork._();

  factory MercatosNetwork() => _singleton;

  Future<dynamic>? postRequest(
    NetworkRequest networkRequest,
  ) async {
    final dio_request = Dio(
      BaseOptions(
        baseUrl: _domain,
        headers: networkRequest.header,
        validateStatus: (_) => true,
      ),
    );

    if (networkRequest.body != null) {
      Map<String, dynamic> map = networkRequest.body!;

      if (networkRequest.file_path != null &&
          networkRequest.file_path!.isNotEmpty) {
        map.addAll(
          networkRequest.file_path!.isNotEmpty
              ? {
                  networkRequest.file_path!.keys.first:
                      MultipartFile.fromFileSync(
                    networkRequest.file_path!.values.first,
                    contentType: MediaType(
                      "image",
                      networkRequest.file_path!.values.first.split('.').last,
                    ),
                  )
                }
              : {},
        );
      }

      FormData formData = FormData.fromMap(map);

      final response = await dio_request.post(
        "/${networkRequest.endpoint}",
        data: formData,
      );

      // check if the response is success or not
      // in case we need repose pass it
      return response.data;
    } else {
      return null;
    }
  }

  Future<dynamic> getRequest(
    NetworkRequest networkRequest,
  ) async {
    final dio_request = Dio(
      BaseOptions(
        baseUrl: _domain,
        headers: networkRequest.header,
        validateStatus: (_) => true,
      ),
    );

    final response = await dio_request.get(
      "/${networkRequest.endpoint}",
    );

    return response.data;
  }
}
