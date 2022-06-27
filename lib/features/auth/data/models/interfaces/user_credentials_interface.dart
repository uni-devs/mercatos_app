abstract class UserCredentials {
  final String access_token;
  final String expired_date;

  const UserCredentials({
    required this.access_token,
    required this.expired_date,
  });
}
