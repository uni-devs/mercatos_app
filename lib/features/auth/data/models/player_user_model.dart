import 'dart:convert';

import 'interfaces/interfaces.dart';

class PlayerUser implements User, UserCredentials {
  final String game_id;
  final String team_id;

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

  const PlayerUser({
    required this.id,
    required this.name,
    required this.email,
    required this.created_at,
    required this.updated_at,
    required this.access_token,
    required this.expired_date,
    required this.game_id,
    required this.team_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'game_id': game_id,
      'teams_id': team_id,
      'access_token': access_token,
      'expired_date': expired_date,
      'id': id,
      'name': name,
      'email': email,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory PlayerUser.PlayerUser(Map<String, dynamic> map) {
    return PlayerUser(
      game_id: map['game_id'] ?? "",
      team_id: map['team_id'] ?? "",
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

  factory PlayerUser.fromJson(String source) =>
      PlayerUser.PlayerUser(json.decode(source));
}
