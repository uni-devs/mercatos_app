abstract class Endpoints {
  // auth
  static const String login = '/api/auth/login';
  static const String social_login = '/api/auth/social/login';
  static const String resendOTP = '/api/auth/resend-otp';
  static const String register = '/api/auth/register';
  static const String verify = '/api/auth/verify';
  static const String setPassword = '/api/auth/password/set';
  static const String reset = '/api/auth/password/reset';
  static const String get_profile = '/api/auth/get_profile';
  static const String logout = '/api/auth/logout';
  static const String me = '/api/auth/me';

  // add kargo
  static const String get_list_receivers = '/api/receivers';

  static const String add_receiver = '/api/receivers';

  static const String get_list_senders = '/api/cargo/senderAddress';

  static const String make_shipment = '/api/cargo/makeShipment';

  static const String payment_methods = '/api/cargo/paymentMethods';

  static const String shipping_methods = '/api/cargo/shippingMethods';

  static const String arrival_branches = '/api/cargo/arrivalBranches';

  static const String collection_types = '/api/cargo/collectionType';

  /// @param {query} number
  static const String single_cargo = '/api/cargo/single/';

  // with /countryID
  static const String get_list_cities = '/api/csc/cities';
  // with /cityID
  static const String get_list_states = '/api/csc/states';

  static const String my_cargo = "/api/cargo/myCargos";

  static const String get_home = "/api/home";
}
