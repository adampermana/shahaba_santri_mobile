import 'package:hive_ce/hive.dart';

part 'auth_data_hive.g.dart';

@HiveType(typeId: 0)
class AuthDataHive {
  AuthDataHive({
    this.id,
    this.name,
    this.phoneNumber,
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.isProfileCompleted,
  });

  factory AuthDataHive.fromMap(Map<String, dynamic> json) => AuthDataHive(
    id: json['id'] as int?,
    name: json['name'] as String?,
    phoneNumber: json['phone_number'] as String?,
    accessToken: json['access_token'] as String?,
    refreshToken: json['refresh_token'] as String?,
    tokenType: json['token_type'] as String?,
    expiresIn: json['expires_in'] as int?,
    isProfileCompleted: json['is_profile_completed'] as bool?,
  );

  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phoneNumber;

  @HiveField(3)
  String? accessToken;

  @HiveField(4)
  String? refreshToken;

  @HiveField(5)
  String? tokenType;

  @HiveField(6)
  int? expiresIn;

  @HiveField(7)
  bool? isProfileCompleted;

  AuthDataHive copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    int? expiresIn,
    bool? isProfileCompleted,
  }) => AuthDataHive(
    id: id ?? this.id,
    name: name ?? this.name,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    accessToken: accessToken ?? this.accessToken,
    refreshToken: refreshToken ?? this.refreshToken,
    tokenType: tokenType ?? this.tokenType,
    expiresIn: expiresIn ?? this.expiresIn,
    isProfileCompleted: isProfileCompleted ?? this.isProfileCompleted,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'phone_number': phoneNumber,
    'access_token': accessToken,
    'refresh_token': refreshToken,
    'token_type': tokenType,
    'expires_in': expiresIn,
    'is_profile_completed': isProfileCompleted,
  };
}
