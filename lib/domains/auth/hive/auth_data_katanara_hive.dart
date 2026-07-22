import 'package:hive_ce/hive.dart';

part 'auth_data_katanara_hive.g.dart';

@HiveType(typeId: 1)
class AuthDataKatanaraHive {
  AuthDataKatanaraHive({
    this.id,
    this.email,
    this.name,
    this.role,
    this.token,
    this.expiresAt,
    this.tags,
  });

  factory AuthDataKatanaraHive.fromMap(Map<String, dynamic> json) =>
      AuthDataKatanaraHive(
        id: json['id'] as int?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        role: json['role'] as String?,
        token: json['token'] as String?,
        expiresAt: json['expires_at'] as int?,
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? role;

  @HiveField(4)
  String? token;

  @HiveField(5)
  int? expiresAt;

  @HiveField(6)
  List<String>? tags;

  AuthDataKatanaraHive copyWith({
    int? id,
    String? email,
    String? name,
    String? role,
    String? token,
    int? expiresAt,
    List<String>? tags,
  }) => AuthDataKatanaraHive(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    role: role ?? this.role,
    token: token ?? this.token,
    expiresAt: expiresAt ?? this.expiresAt,
    tags: tags ?? this.tags,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'email': email,
    'name': name,
    'role': role,
    'token': token,
    'expires_at': expiresAt,
    'tags': tags,
  };
}
