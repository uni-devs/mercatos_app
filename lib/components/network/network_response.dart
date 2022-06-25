enum NetworkResponseType { success, error }

class NetworkResponse {
  final NetworkResponseType? type;
  final String? message;
  final Map<String, List<String>>? error_message;
  final Map<String, dynamic>? data;

  const NetworkResponse(
      {this.type, this.message, this.error_message, this.data});

  factory NetworkResponse.fromJson(Map<String, dynamic> json) {
    Map<String, List<String>>? errors_map;

    Map<String, dynamic>? errors = json["errors"];

    if (errors != null) {
      errors_map = errors.map(
        (key, value) {
          List<dynamic> list = value;
          List<String> newList = list.map((e) => e.toString()).toList();
          return MapEntry(key, newList);
        },
      );
    }

    final bool? status = (json["status"]);

    final String? message;

    if (json["message"] != null) {
      message = json["message"].toString();
    } else {
      message = null;
    }

    final Map<String, dynamic>? data = json["data"];

    return NetworkResponse(
      type: status == null
          ? NetworkResponseType.error
          : status == true
              ? NetworkResponseType.success
              : NetworkResponseType.error,
      message: message,
      error_message: errors_map,
      data: data,
    );
  }
  @override
  String toString() =>
      'NetworkResponse:: { type: $type, message: $message, error_message: $error_message, data: $data }';
}
