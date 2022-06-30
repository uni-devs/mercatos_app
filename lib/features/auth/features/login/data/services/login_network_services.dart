import '../../../../../../components/network/mercatos_network.dart';
import 'login_requests.dart';

abstract class LoginNetwork {
  static Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    final dynamic data = await MercatosNetwork().postRequest(
      LoginRequest(
        body: {
          "email": email,
          "password": password,
        },
      ),
    );
    return data;
  }
}
