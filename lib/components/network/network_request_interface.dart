abstract class NetworkRequest {
  final String endpoint;
  final Map<String, dynamic>? body;
  final Map<String, String>? header;
  final Map<String, String>? file_path;

  const NetworkRequest({
    required this.endpoint,
    this.body,
    this.header,
    this.file_path,
  });
}
