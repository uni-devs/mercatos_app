import '../../../../../../components/network/endpoints.dart';
import '../../../../../../components/network/network_request_interface.dart';

class LoginRequest extends NetworkRequest {
  const LoginRequest({required Map<String, dynamic> body})
      : super(
          endpoint: Endpoints.login,
          body: body,
        );
}
