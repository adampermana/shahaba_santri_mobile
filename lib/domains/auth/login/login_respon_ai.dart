import 'package:json_annotation/json_annotation.dart';

part 'login_respon_ai.g.dart';

@JsonSerializable()
class LoginResponAI {
  LoginResponAI({
    this.id,
    this.email,
    this.name,
    this.role,
    this.token,
    this.expiresAt,
    this.tags,
  });

  factory LoginResponAI.fromJson(Map<String, dynamic> json) =>
      _$LoginResponAIFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponAIToJson(this);

  final int? id;
  final String? email;
  final String? name;
  final String? role;
  final String? token;

  @JsonKey(name: 'expires_at')
  final int? expiresAt;

  final List<String>? tags;

  LoginResponAI copyWith({
    int? id,
    String? email,
    String? name,
    String? role,
    String? token,
    int? expiresAt,
    List<String>? tags,
  }) => LoginResponAI(
    id: id ?? this.id,
    email: email ?? this.email,
    name: name ?? this.name,
    role: role ?? this.role,
    token: token ?? this.token,
    expiresAt: expiresAt ?? this.expiresAt,
    tags: tags ?? this.tags,
  );
}
