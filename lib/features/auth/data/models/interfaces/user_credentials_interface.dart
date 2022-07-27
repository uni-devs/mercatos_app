abstract class UserCredentials {
  final String access_token;
  final String expired_date;
  final String refresh_token;

  const UserCredentials({
    required this.access_token,
    required this.expired_date,
    required this.refresh_token,
  });
}
