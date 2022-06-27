abstract class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
  });

  final int id;
  final String name;
  final String email;
  final String created_at;
  final String updated_at;
}
