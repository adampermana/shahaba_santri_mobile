// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_katanara_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthDataKatanaraHiveAdapter extends TypeAdapter<AuthDataKatanaraHive> {
  @override
  final typeId = 1;

  @override
  AuthDataKatanaraHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthDataKatanaraHive(
      id: (fields[0] as num?)?.toInt(),
      email: fields[1] as String?,
      name: fields[2] as String?,
      role: fields[3] as String?,
      token: fields[4] as String?,
      expiresAt: (fields[5] as num?)?.toInt(),
      tags: (fields[6] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, AuthDataKatanaraHive obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.token)
      ..writeByte(5)
      ..write(obj.expiresAt)
      ..writeByte(6)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthDataKatanaraHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
