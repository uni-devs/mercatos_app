import 'dart:convert';

import 'interfaces/interfaces.dart';

class WatcherUser implements User, UserCredentials {
  final List<String> my_favor;

  @override
  final String access_token;
  @override
  final String expired_date;
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String created_at;
  @override
  final String updated_at;

  const WatcherUser({
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
    required this.access_token,
    required this.expired_date,
    required this.my_favor,
  });

  Map<String, dynamic> toMap() {
    return {
      'my_favor': my_favor,
      'access_token': access_token,
      'expired_date': expired_date,
      'id': id,
      'name': name,
      'email': email,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory WatcherUser.fromMap(Map<String, dynamic> map) {
    return WatcherUser(
      my_favor: List<String>.from(map['my_favor']),
      access_token: map['access_token'] ?? '',
      expired_date: map['expired_date'] ?? '',
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WatcherUser.fromJson(String source) =>
      WatcherUser.fromMap(json.decode(source));
}
