import 'dart:convert';

import 'interfaces/interfaces.dart';

class CoachUser implements User, UserCredentials {
  final List<String> players_id;
  final List<String> teams_id;

  @override
  final String access_token;

  @override
  final String refresh_token;
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

  const CoachUser({
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
    required this.access_token,
    required this.expired_date,
    required this.players_id,
    required this.teams_id,
    required this.refresh_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'players_id': players_id,
      'teams_id': teams_id,
      'access_token': access_token,
      'expired_date': expired_date,
      'id': id,
      'name': name,
      'email': email,
      'created_at': created_at,
      'updated_at': updated_at,
      'refresh_token': refresh_token,
    };
  }

  factory CoachUser.CoachUser(Map<String, dynamic> map) {
    return CoachUser(
      players_id: List<String>.from(map['players_id']),
      teams_id: List<String>.from(map['teams_id']),
      access_token: map['access_token'] ?? '',
      expired_date: map['expired_date'] ?? '',
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      created_at: map['created_at'] ?? '',
      updated_at: map['updated_at'] ?? '',
      refresh_token: map['refresh_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachUser.fromJson(String source) =>
      CoachUser.CoachUser(json.decode(source));
}
